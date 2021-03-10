%{
#include <stdio.h>
#include<stdlib.h>
#include<string.h>
int yylex();
void yyerror();
int sym[26];
%}
%start program
%union{
	  char name[20];
      int number;
}
%token STRING NUMBER VARIABLE INTEGER CHAR IF ELSE WHILE
%left '+' '-'
%left '*' '/' '%'
%left '(' ')'
%%
program:
        statement   
        | statement program
        ;

statement:
	stmt ';'
	;

stmt:
		
	| INTEGER VARIABLE '='  expr 
	| INTEGER VARIABLE 
	| VARIABLE '=' NUMBER
	| CHAR VARIABLE '=' STRING
	| CHAR VARIABLE
	| VARIABLE '=' STRING 
	| IF '(' expr ')' '{' program '}' 
	| IF '(' expr ')' '{' program '}'ELSE '{'program'}'
	| WHILE '(' expr ')' '{' program '}'
	;
expr:
	  NUMBER 
        | VARIABLE                
        | expr '-' expr           
        | expr '+' expr           
        | expr '*' expr           
        | expr '/' expr           
	| expr '%' expr   			
        | '(' expr ')'
	;

%%
  
void main() 
{ 
   printf("Enter Any Arithmetic Expression:\n"); 
   yyparse();  
   printf("Valid\n");
   exit(0);
} 
void yyerror() 
{ 
   printf("Invalid\n"); 
   exit(0); 
}
