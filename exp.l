%option noyywrap

%{
  #include <cstdio>
  #include <iostream>
  using namespace std;
  #include "exp.tab.h" // to get the token types from Bison
  int whitespace_num = 1;
%}

whitespace  [ \t\r\v\f]
linefeed    \n

%%

[a-zA-Z0-9]+            {yylval.sval = strdup(yytext); return ID;}
"("                     {return (OPENBRACKET);}
")"                     {return (CLOSEDBRACKET);}
"+" |
"-" |
"*" |
"/" |
"%"                     {yylval.opval = strdup(yytext); return OP;}
";"                     {return (SEMICOLON);}
"="                     {return (EQUALS);}
{linefeed}              {cout << endl; whitespace_num = 1; return NEWLINE;}
{whitespace}            {cout << " "; whitespace_num++; ;}

%%
