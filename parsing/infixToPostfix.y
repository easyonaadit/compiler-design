%{
#include <stdio.h>    
%}

%union{
    int integer_value;
    char * string_value;
}

%token<string_value> IDENTIFIER
%token<integer_value> INTEGER_LITERAL
%token PLUS MINUS DIVIDE TIMES

%left PLUS MINUS
%left TIMES DIVIDE

%%

exp : exp PLUS exp {printf("+");}
| exp MINUS exp {printf("-");}
| exp TIMES exp {printf("*");}
| exp DIVIDE exp {printf("/");}
| IDENTIFIER {printf("%s ", $1);}
| INTEGER_LITERAL {printf("%d ", $1);}