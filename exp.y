%{
  #include <cstdio.h>
  #include <iostream.h>
  using namespace std;

  // Declare stuff from Flex that Bison needs to know about:
  extern int yylex();
  extern int yyparse();
  extern int line_num;
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


%%
exp:  correctExpression
      | assignment
      ;
assignment:
      ID EQUALS expression SEMICOLON
      ;
correctExpression:
      expression SEMICOLON
      ;
expression:
      ID                            {cout << "Testing, expression id here: " << $1 << endl;}
      | expression OP ID            {cout << "Testing, expression: expressionop id here " << $2 << " " << $3 << endl;}
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
