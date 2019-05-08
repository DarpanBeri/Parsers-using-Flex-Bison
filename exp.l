%{
  #include <cstdio>
  #include <iostream>
  using namespace std;
  #include "exp.tab.h" // to get the token types from Bison
  int whitespace_num = 1;
%}

%option noyywrap

whitespace  [ \t\r\v\f]
linefeed    \n

%%

[a-zA-Z0-9]+            {yylval.sval = strdup(yytext); cout << "Read an ID: " << strdup(yytext) << endl; return ID;}
"+" |
"-" |
"*" |
"/" |
"%"                     {yylval.opval = strdup(yytext); cout << "Read an OP: " << strdup(yytext) << endl; return OP;}
";"                     {printf("Read an SEMICOLON. \n"); return (SEMICOLON);}
"="                     {printf("Read an EQUALS. \n"); return (EQUALS);}
{linefeed}              {printf("Read an NEWLINE. \n"); whitespace_num = 1; return NEWLINE;}
{whitespace}            {whitespace_num++; ;}
.                       // give error for unknown shit

%%
