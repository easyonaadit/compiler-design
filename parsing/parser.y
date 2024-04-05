%{
    
%}

%union{
    int num;
    char sym;
}

%token EOL
%token<num> NUMBER
%type<num> exp
%token PLUS

%%
input: 
| line input;
line : exp EOL  {printf("%d\n", $1);}
| EOL;
exp : NUMBER {$$ = $1;}
| exp PLUS exp {$$ = $1 + $3;} ;

%%

int main(){
    yyparse();
    return 0;
}

int yyerror(char *s){
    printf("\nERROR: %s", s);
    return 0;
}