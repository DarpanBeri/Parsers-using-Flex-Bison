%{
  #include <cstdio>
  #include <iostream>
  using namespace std;

  // Declare stuff from Flex that Bison needs to know about:
  extern int yylex();
  extern int yyparse();
  int line_num = 1;
  extern FILE *yyin;

  void yyerror(const char *s);
%}

%define parse.lac full
%define parse.error verbose

%union {
  char* sval;
  char* opval;
  char* otherval;
}

%token <sval> ID
%token <otherval> SEMICOLON
%token <opval> OP
%token <otherval> EQUALS
%token NEWLINE


%%
statements:
      statements statement NEWLINE      {line_num++;}
      | statement NEWLINE               {line_num++;}
      | statements statement
      | statement
      ;
statement:
      assignment
      | correctExpression
      ;
assignment:
      ID EQUALS expression SEMICOLON
      ;
correctExpression:
      expression SEMICOLON
      ;
expression:
      expression OP ID
      | ID
      ;
%%

int main(int, char**) {

  // open a file handle to a particular file:
  FILE *myfile = fopen("ex.txt", "r");

  // make sure it's valid:
  if (!myfile) {
    cout << "Unable to open file. File invalid." << endl;
    return -1;
  }

  // Set Flex to read from it instead of defaulting to STDIN:
  yyin = myfile;

  // Parse through the input:
  yyparse();
}

void yyerror(const char *s) {
  cout << "EEK, parse error on line " << line_num << "!  Message: " << s << endl;
}
