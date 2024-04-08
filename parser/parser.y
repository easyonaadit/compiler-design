%{
#include <stdio.h>
#include "treeDefinitions.h"

int current_line_number = 1;
#define yywrap() 1

int yylex();

expresstionTree root;


expresstionTree operatorExpression(optype op, expresstionTree left, expresstionTree right){
    expresstionTree retval = (expresstionTree) malloc(sizeof(struct expression));

    retval->kind = operatorExp;
    retval->u.oper.op = op;
    retval->u.oper.left = left;
    retval->u.oper.right = right;

    return retval;
}
expresstionTree IdentifierExpression(char *variable){
    expresstionTree retval = (expresstionTree) malloc(sizeof(struct expression));

    retval->kind = variableExp;
    retval->u.variable = variable;

    return retval;

}
expresstionTree ConstantExpression(int constantVal){
    expresstionTree retval = (expresstionTree) malloc(sizeof(struct expression));

    retval->kind = constantExp;
    retval->u.constantVal = constantVal;

    return retval;
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
} 

%token EOL
%token<string_value> IDENTIFIER
%token<integer_value> INTEGER_LITERAL
%token<line_number> PLUS MINUS TIMES DIVIDE
%type<integer_value> exp term

%%
input: 
| line input;
line : exp EOL  {printf("%d\n", $1.value);}
| EOL 
exp : exp PLUS term {$$.value = $1.value + $3.value; }
exp : exp MINUS term {$$.value = $1.value - $3.value; }
exp : term
term : term TIMES INTEGER_LITERAL {$$.value = $1.value * $3.value; }
term : term DIVIDE INTEGER_LITERAL {$$.value = $1.value / $3.value; }
term : INTEGER_LITERAL {$$.value = $1.value;}

%%

int main(){
    yyparse();
    return 0;
}
int yyerror(char *s){
    fprintf(stderr, "%s:%d : %s: %s\n", __FILE__,current_line_number, s, yylval);
    return 0;
}

