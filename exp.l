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

[a-zA-Z0-9]+            {yylval.sval = strdup(yytext); cout << strdup(yytext); return ID;}
"+" |
"-" |
"*" |
"/" |
"%"                     {yylval.opval = strdup(yytext); cout << strdup(yytext); return OP;}
";"                     {cout << ";"; return (SEMICOLON);}
"="                     {cout << "="; return (EQUALS);}
{linefeed}              {cout << endl; whitespace_num = 1; return NEWLINE;}
{whitespace}            {cout << " "; whitespace_num++; ;}
.                       // give error for unrecognized stuff

%%
