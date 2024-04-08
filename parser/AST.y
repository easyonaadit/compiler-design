%{
#include <stdio.h>
#include <stdlib.h>
#include "treeDefinitions.h"

int current_line_number = 1;
#define yywrap() 1

int yylex();

expresstionTree root;


expresstionTree operatorExpression(optype op, expresstionTree left, expresstionTree right, int line_number){
    expresstionTree retval = (expresstionTree) malloc(sizeof(struct expression));

    retval->kind = operatorExp;
    retval->u.oper.op = op;
    retval->u.oper.left = left;
    retval->u.oper.right = right;
    retval->line_number = line_number;

    return retval;
}
expresstionTree IdentifierExpression(char *variable, int line_number){
    expresstionTree retval = (expresstionTree) malloc(sizeof(struct expression));

    retval->kind = variableExp;
    retval->u.variable = variable;
    retval->line_number = line_number;

    return retval;

}
expresstionTree ConstantExpression(int constantVal, int line_number){
    expresstionTree retval = (expresstionTree) malloc(sizeof(struct expression));

    retval->kind = constantExp;
    retval->u.constantVal = constantVal;
    retval->line_number = line_number;

    return retval;
}



void printTree(expresstionTree root){

    
    if(root->kind == constantExp) {
        printf("%d ",root->u.constantVal);
        return;
    }
    if(root->kind == operatorExp){
        

        printTree(root->u.oper.left);
        printTree(root->u.oper.right);
        switch(root->u.oper.op){
            case 0: printf("+ "); break;
            case 1: printf("- "); break;
            case 2: printf("* "); break;
            case 3: printf("/ "); break;
            default:  printf(" in default case.\n"); break;
        }
    }

    
}

void printDriver(){
    printf("\n---------TREE TRAVERSAL:---------\n");
    printf("\033[0;31m"); 
    printTree(root); 
    printf("\033[0m");
    printf("\n---------TREE TRAVERSAL OVER---------\n");

}


%}

%union{
    struct{
        int value; 
        int line_number;
    } integer_value;
    struct{
        char *value;
        int line_number;
    } string_value;
    int line_number;
    expresstionTree expression;
} 

%token EOL
%token<string_value> IDENTIFIER
%token<integer_value> INTEGER_LITERAL
%token<line_number> PLUS MINUS TIMES DIVIDE
%type<expression> exp term

%%
input: 
| line input;
line : exp EOL  {root = $1; printDriver(); }
| EOL 
exp : exp PLUS term {$$ = operatorExpression(PlusOp, $1, $3, $1->line_number); }
exp : exp MINUS term {$$ = operatorExpression(MinusOp, $1, $3, $1->line_number ); }
exp : term {$$ = $1;}
term : term TIMES INTEGER_LITERAL {$$ = operatorExpression(TimesOp, $1, ConstantExpression($3.value, $3.line_number), $1->line_number ); }
term : term DIVIDE INTEGER_LITERAL {$$ = operatorExpression(DivideOp, $1, ConstantExpression($3.value, $3.line_number), $1->line_number ); }
term : INTEGER_LITERAL {$$ = ConstantExpression($1.value, $1.line_number);}

%%

int main(){
    yyparse();
    return 0;
}
int yyerror(char *s){
    fprintf(stderr, "%s:%d : %s: %s\n", __FILE__,current_line_number, s, yylval);
    return 0;
}

