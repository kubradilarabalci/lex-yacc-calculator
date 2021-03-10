%{

#include <stdio.h>
#include <string.h>
#include "y.tab.h"
void showError();
%}


numbers     [0-9]
alpha       [a-zA-Z]
whiteSpace  [ \n\t]

%%
"int" 				return INTEGER;
"char"				return CHAR;
"if"				return IF;
"else"				return ELSE;
"while"				return WHILE;
\"(\\.|[^"])*\"			return STRING;
\'{alpha}\'			return STRING;
{alpha}+       			return VARIABLE; 					
{numbers}*     	   		return NUMBER;
[-+%)(/*=;] 	    		return *yytext; 
{whiteSpace}+						 
.                   		return yytext[0];  

%%


void showError(){
    printf("Other input");
}
int yywrap() 
{ 
	return 1; 
}
