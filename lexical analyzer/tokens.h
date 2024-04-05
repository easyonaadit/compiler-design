#ifndef TOKENS_H
#define TOKENS_H

// KEYWORDS : 1000

#define BREAK 1000
#define CASE 1001
#define CHAR 1002
#define CONST 1003
#define CONTINUE 1004
#define DEFAULT 1005
#define DO 1006
#define DOUBLE 1007
#define ELSE 1008
#define ENUM 1009
#define EXTERN 1010
#define FLOAT 1011
#define FOR 1012
#define IF 1013
#define INT 1014
#define LONG 1015
#define REGISTER 1016
#define RETURN 1017
#define SHORT 1018
#define SIGNED 1019
#define SIZEOF 1020
#define STRUCT 1021
#define SWITCH 1022
#define TYPEDEF 1023
#define UNION 1024
#define UNSIGNED 1025
#define VOID 1026
#define WHILE 1027
#define INCLUDE 1028
#define MAIN 1029
// auto 	Specifies automatic storage class
// goto	Jumps to a labeled statement
// static	Specifies static storage class

// OPERATORS : 2000
// 1. Unary
#define INCREMENT 2000
#define DECREMENT 2001
// 2. Binary
// 2.1. Arithematic
#define ADD 2002
#define SUBTRACT 2003
#define MULTIPLY 2004
#define DIVIDE 2005
#define MODULO 2006
// 2.2. Logical
#define AND 2007
#define OR 2008
#define NOT 2009
// 2.3. Relational
#define GREATER_THAN 2010
#define LESSER_THAN 2011
#define GREATER_THAN_EQUALS 2012
#define LESS_THAN_EQUALS 2013
#define EQUALS 2014
#define NOT_EQUALS 2015
// 2.4. Assigment
#define ASSIGMENT 2016
// +=, -=, *=, /=, %=
// 2.5. Bitwise Operator
// 2.6. Ternary Operator

// SPECIAL SYMBOLS : 3000
#define OPEN_BRACE 3000    // {
#define CLOSE_BRACE 3001   // }
#define OPEN_PARAN 3002    // (
#define CLOSE_PARAN 3003   // )
#define OPEN_BRACKET 3004  // [
#define CLOSE_BRACKET 3005 // ]
#define SEMICOLON 3006
#define COMMA 3007
#define DOT 3008
#define POINTER_ASSIGN 3009
#define POINTER_DEREFERENCE 3010
#define NEW_LINE_FEED 3011

// IDENTIFIER : 4000
#define IDENTIFIER 4000
#define FUNCTION 4001

// LITERALS : 5000
#define LITERAL 5000
#define STRING 5001

// COMMENT : 6000
#define COMMENT 6000

#endif
