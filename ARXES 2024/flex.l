%{
#include <stdio.h>
#include "parser.tab.h"


%}

%option noyywrap 
/* Integrated Μεταβλητή που μετράει τις καινούργιες γραμμές στο αρχείο εισόδου και αυξάνει έναν μετρητή */
%option yylineno


/* Στην περίπτωση αυτή, το %x COMMENT δηλώνει μια συνθήκη έναρξης με το όνομα COMMENT, η οποία ενεργοποιείται όταν ο λεξικογράφος συναντήσει την αρχή ενός σχολίου στην είσοδο. */
%x COMMENT

%%
"public"                { printf("Variable: %s\n", yytext);return PUBLIC; }
"private"               { return PRIVATE; }
"void"                  { return VOID; }
"int"                   { return INT; }
"char"                  { return CHAR; }
"double"                { return DOUBLE; }
"boolean"               { return BOOLEAN; }
"String"                { return STRING; }
"class"                 { return CLASS; }
"new"                   { return NEW; }
"return"                { return RETURN; }
"if"                    { return IF; }
"else"                  { return ELSE; }
"while"                 { return WHILE; }
"do"                    { return DO; }
"for"                   { return FOR; }
"switch"                { return SWITCH; }
"case"                  { return CASE; }
"default"               { return DEFAULT; }
"break"                 { return BREAK; }
"true"                  { return TRUE; }
"false"                 { return FALSE; }
"out.print"             { return OUTPRINT; }
"out.println"           { return OUTPRINTLN; } 


"{"                     { printf("Variable: %s\n", yytext);return RIGHT_BRC; }
"}"                     { printf("Variable: %s\n", yytext);return LEFT_BRC; }
"("                     { return RIGHT_PAR; }
")"                     { return LEFT_PAR; }
";"                     { return EROTIMATIKO; }
":"                     { return COLON; }
","                     { return COMMA; }
"="                     { return EQUALS; }
\"                  { return QT; }
"=="                    { return EQ_OP; }
"!="                    { return NE_OP; }
">"                     { return GREATER_THAN; }
"<"                     { return LESS_THAN; }
">="                    { return GE_OP; }
"<="                    { return LE_OP; }
"+"                     { return PLUS; }
"-"                     { return MINUS; }
"*"                     { return STAR; }
"/"                     { return SLASH; }
"&&"                    { return AND_OP; }
"||"                    { return OR_OP; }

"//".*                  { /* Ignore single-line comments */ }


"/*"([^*]|(\*+[^*/]))*"*/" { /* Ignore multi-line comments */ }

[ \t\n\r]+              { /* Ignore whitespace */ }

[A-Za-z][_A-Za-z0-9]*    { printf("Variable: %s\n", yytext); return T_VAR; }
   /* Κανονική Έκφραση για ακέραιο */
[0-9]+                   { yylval = atoi(yytext); return T_INTEGER; }
   /* Κανονική Έκφραση για δεκαδικό */
[+-]?[0-9]+\.[0-9]+     { return T_DOUBLE; }



%%