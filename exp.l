%option noyywrap

%{
  /*************************************************************
 Name: Darpan Beri
 Project: Parsers-using-Flex-Bison
 File: exp.l
 Notes: This file cointains the lexical rules, written in Flex.
 *************************************************************/
  #include <iostream> // Needed for cout
  using namespace std;
  #include "exp.tab.h" // to get the token types from Bison
  int whitespace_num = 1;
%}

whitespace  [ \t\r\v\f]
linefeed    \n

%%
[a-zA-Z][a-zA-Z0-9]*    {ECHO; yylval.sval = strdup(yytext); return ID;}
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
.                       {ECHO; return (INVALIDTOKEN);}
%%
