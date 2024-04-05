%{
#include "parser.tab.h"
#include <string.h>
#ifdef yywrap
#undef yywrap
#endif
#define yywrap() 1
int current_line_number;

void newLine(){
    current_line_number++;
}
%}

%x COMMENT
%x PARTIAL_STATE

%%
[0-9]+ {yylval.integer_value.value = atoi(yytext); yylval.integer_value.line_number = current_line_number; return INTEGER_LITERAL;}
"+" {yylval.line_number = current_line_number; return PLUS;}
"-" {yylval.line_number = current_line_number; return MINUS;}
"*" {yylval.line_number = current_line_number; return TIMES;}
"/" {yylval.line_number = current_line_number; return DIVIDE;}
[a-zA-Z][a-zA-Z_0-9]* {yylval.string_value.value = malloc(sizeof(char)*strlen(yytext)+1); strcpy(yylval.string_value.value, yytext); yylval.string_value.line_number = current_line_number; return IDENTIFIER;}
\n { newLine(); return EOL;}
"//".*\n {}
"/*".* {BEGIN(COMMENT);}
<COMMENT>"*" {BEGIN(PARTIAL_STATE);}
<PARTIAL_STATE>[^/] {BEGIN(COMMENT);}
<PARTIAL_STATE>"/" {BEGIN(INITIAL);}
<COMMENT>\n* {}
" " {}
\t {}
. {}
%%

