%{

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

%token <string_value> IDENTIFIER
%token <integer_value> INTEGER_LITERAL
%token <line_number> PLUS MINUS TIMES DIVIDE

%%
exp : term PLUS term
term : IDENTIFIER

%%

int main(){
    yyparse();
    return 0;
}

