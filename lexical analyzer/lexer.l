%{
#include <stdio.h>
#include <stdlib.h>
#include "tokens.h"

#define yywrap() 1
FILE *yyin;

typedef union{
    int line_number;
} line;
line lno = {1}; // Initialize line number to 1

void increment_line_number() {
    lno.line_number++;
}
%}

DIGIT [0-9]
STRING [a-zA-Z]
VALID_VARIABLE_NAME [a-zA-Z$][a-zA-Z0-9$]*

%%

"break"	{printf("%d : %s (Line No: %d)\n", BREAK, yytext, lno.line_number);}
"case"	{printf("%d : %s (Line No: %d)\n", CASE, yytext, lno.line_number);}
"char"	{printf("%d : %s (Line No: %d)\n", CHAR, yytext, lno.line_number);}
"const"	{printf("%d : %s (Line No: %d)\n", CONST, yytext, lno.line_number);}
"continue"	{printf("%d : %s (Line No: %d)\n", CONTINUE, yytext, lno.line_number);}
"default"	{printf("%d : %s (Line No: %d)\n", DEFAULT, yytext, lno.line_number);}
"do"	{printf("%d : %s (Line No: %d)\n", DO, yytext, lno.line_number);}
"double"	{printf("%d : %s (Line No: %d)\n", DOUBLE, yytext, lno.line_number);}
"else"	{printf("%d : %s (Line No: %d)\n", ELSE, yytext, lno.line_number);}
"enum"	{printf("%d : %s (Line No: %d)\n", ENUM, yytext, lno.line_number);}
"extern"	{printf("%d : %s (Line No: %d)\n", EXTERN, yytext, lno.line_number);}
"float"	{printf("%d : %s (Line No: %d)\n", FLOAT, yytext, lno.line_number);}
"for"	{printf("%d : %s (Line No: %d)\n", FOR, yytext, lno.line_number);}
"if"	{printf("%d : %s (Line No: %d)\n", IF, yytext, lno.line_number);}
"int"	{printf("%d : %s (Line No: %d)\n", INT, yytext, lno.line_number);}
"long"	{printf("%d : %s (Line No: %d)\n", LONG, yytext, lno.line_number);}
"register"	{printf("%d : %s (Line No: %d)\n", REGISTER, yytext, lno.line_number);}
"return"	{printf("%d : %s (Line No: %d)\n", RETURN, yytext, lno.line_number);}
"short"	{printf("%d : %s (Line No: %d)\n", SHORT, yytext, lno.line_number);}
"signed"	{printf("%d : %s (Line No: %d)\n", SIGNED, yytext, lno.line_number);}
"sizeof"	{printf("%d : %s (Line No: %d)\n", SIZEOF, yytext, lno.line_number);}
"struct"	{printf("%d : %s (Line No: %d)\n", STRUCT, yytext, lno.line_number);}
"switch"	{printf("%d : %s (Line No: %d)\n", SWITCH, yytext, lno.line_number);}
"typedef"	{printf("%d : %s (Line No: %d)\n", TYPEDEF, yytext, lno.line_number);}
"union"	{printf("%d : %s (Line No: %d)\n", UNION, yytext, lno.line_number);}
"unsigned"	{printf("%d : %s (Line No: %d)\n", UNSIGNED, yytext, lno.line_number);}
"void"  {printf("%d : %s (Line No: %d)\n", VOID, yytext, lno.line_number);}
"while" {printf("%d : %s (Line No: %d)\n", WHILE, yytext, lno.line_number);}
"#include" {printf("%d : %s (Line No: %d)\n", INCLUDE, yytext, lno.line_number);}
"main" {printf("%d : %s (Line No: %d)\n", MAIN, yytext, lno.line_number);}

"++" {printf("%d : %s (Line No: %d)\n", INCREMENT, yytext, lno.line_number);}
"--" {printf("%d : %s (Line No: %d)\n", DECREMENT, yytext, lno.line_number);}
"+" {printf("%d : %s (Line No: %d)\n", ADD, yytext, lno.line_number);}
"-" {printf("%d : %s (Line No: %d)\n", SUBTRACT, yytext, lno.line_number);}
"*" {printf("%d : %s (Line No: %d)\n", MULTIPLY, yytext, lno.line_number);}
"/" {printf("%d : %s (Line No: %d)\n", DIVIDE, yytext, lno.line_number);}
"%" {printf("%d : %s (Line No: %d)\n", MODULO, yytext, lno.line_number);}
"&&" {printf("%d : %s (Line No: %d)\n", AND, yytext, lno.line_number);}
"||" {printf("%d : %s (Line No: %d)\n", OR, yytext, lno.line_number);}
"!" {printf("%d : %s (Line No: %d)\n", NOT, yytext, lno.line_number);}
">" {printf("%d : %s (Line No: %d)\n", GREATER_THAN, yytext, lno.line_number);}
"<" {printf("%d : %s (Line No: %d)\n", LESSER_THAN, yytext, lno.line_number);}
">=" {printf("%d : %s (Line No: %d)\n", GREATER_THAN_EQUALS, yytext, lno.line_number, lno.line_number);}
"<=" {printf("%d : %s (Line No: %d)\n", LESS_THAN_EQUALS, yytext, lno.line_number, lno.line_number);}
"==" {printf("%d : %s (Line No: %d)\n", EQUALS, yytext, lno.line_number, lno.line_number);}
"!=" {printf("%d : %s (Line No: %d)\n", NOT_EQUALS, yytext, lno.line_number);}
"=" {printf("%d : %s (Line No: %d)\n", ASSIGMENT, yytext, lno.line_number);}

"(" {printf("%d : %s (Line No: %d)\n", OPEN_PARAN, yytext, lno.line_number);}
")" {printf("%d : %s (Line No: %d)\n", CLOSE_PARAN, yytext, lno.line_number);}
"{" {printf("%d : %s (Line No: %d)\n", OPEN_BRACE, yytext, lno.line_number);}
"}" {printf("%d : %s (Line No: %d)\n", CLOSE_BRACE, yytext, lno.line_number);}
"[" {printf("%d : %s (Line No: %d)\n", OPEN_BRACKET, yytext, lno.line_number);}
"]" {printf("%d : %s (Line No: %d)\n", CLOSE_BRACKET, yytext, lno.line_number);}
";" {printf("%d : %s (Line No: %d)\n", SEMICOLON, yytext, lno.line_number);}
"," {printf("%d : %s (Line No: %d)\n", COMMA, yytext, lno.line_number);}
"." {printf("%d : %s (Line No: %d)\n", DOT, yytext, lno.line_number);}


{VALID_VARIABLE_NAME} {printf("%d : %s (Line No: %d)\n", IDENTIFIER, yytext, lno.line_number);}

\".*\" {printf("%d : %s (Line No: %d)\n", STRING, yytext, lno.line_number);}
[0-9]+ {printf("%d : %s (Line No: %d)\n", LITERAL, yytext, lno.line_number);}



"//".* {printf("%d : %s (Line No: %d)\n", COMMENT, yytext, lno.line_number);}

"\n" {printf("%d : \\n\n", NEW_LINE_FEED);  increment_line_number();}
" " {}
"\t" {}
. {{printf("UnREcognised Char : %s (Line No: %d)\n", yytext, lno.line_number);}}


%%

int main(int argc, char **argv){

    
    FILE *file;
    #pragma GCC diagnostic push
    #pragma GCC diagnostic ignored "-Wint-conversion"
    char *input = *(argv+1);
    #pragma GCC diagnostic pop
    file = fopen(input, "r");
    if(file == NULL){
        printf("Error in opening file\n");
        exit(1);
    }


    yyin = file;

    yylex();

    fclose(file);
    return 0;
}