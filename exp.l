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
[a-zA-Z0-9]+            {ECHO; yylval.sval = strdup(yytext); return ID;}
"("                     {ECHO; return (OPENBRACKET);}
")"                     {ECHO; return (CLOSEDBRACKET);}
"+" |
"-" |
"*" |
"/" |
"%"                     {ECHO; yylval.opval = strdup(yytext); return OP;}
";"                     {ECHO; return (SEMICOLON);}
"="                     {ECHO; return (EQUALS);}
{linefeed}              {ECHO; whitespace_num = 1; return NEWLINE;}
{whitespace}            {ECHO; whitespace_num++; ;}
[^-a-zA-z0-9()+*/%;= \t\n]+                       {cout << "bad token" << endl; return (INVALIDTOKEN);}
%%
