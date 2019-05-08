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
%token OPENBRACKET
%token CLOSEDBRACKET


%%
statements:
      error NEWLINE
      | statements statement NEWLINE    {cout << endl << ">> Valid statement." << endl << endl; line_num++;}
      | statement NEWLINE               {cout << endl << ">> Valid statement."<< endl << endl; line_num++;}
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
      expression OP OPENBRACKET expression CLOSEDBRACKET
      | expression OP ID
      | ID
      ;
%%

int main(int, char**) {

  // open a file handle to a particular file:
  FILE *myfile = fopen("ex.txt", "r");

  cout << endl;

  // make sure it's valid:
  if (!myfile) {
    cout << "Unable to open file. File invalid." << endl;
    return -1;
  }

  // Set Flex to read from the file:
  yyin = myfile;

  // Parse through the input:
  yyparse();
  cout << "------------[End Of Program]----------" << endl;
}

void yyerror(const char *s) {
  cout << endl << ">> Error on line " << line_num << ": " << s << endl;
}
