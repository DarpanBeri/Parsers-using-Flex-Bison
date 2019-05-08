%{
  #include <stdbool.h>
  #include <string.h>
  #include <cstdio>
  #include <iostream>
  using namespace std;

  // Declare stuff from Flex that Bison needs to know about:
  extern int yylex();
  extern int yyparse();
  int line_num = 1; // Keeps track of the line number
  bool errorInStatement = false; // To know if error in statement or not.
  char errorArray[9999][500];
  extern FILE *yyin; // Pointer to the file to be read.

  void yyerror(const char *s);
%}

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
%token INVALIDTOKEN


%%
exp:
      statements
statements:
      error NEWLINE                     {if(errorInStatement){
        errorInStatement = false;
        cout << endl << ">> Error on line " << line_num << ": " << errorArray[line_num] << endl << endl; line_num++;
        }}
      | statements statement NEWLINE    {if(errorInStatement){
        errorInStatement = false;
        cout << endl << ">> Error on line " << line_num << ": " << errorArray[line_num] << endl << endl; line_num++;
        }else
        {cout << endl << ">> Valid statement." << endl << endl; line_num++;}
      }
      | statement NEWLINE               {if(errorInStatement){
        errorInStatement = false;
        cout << endl << ">> Error on line " << line_num << ": " << errorArray[line_num] << endl << endl; line_num++;
        }else
        {cout << endl << ">> Valid statement." << endl << endl; line_num++;}
      }
      | statements statement          {if(errorInStatement){
        errorInStatement = false;
        cout << endl << ">> Error on line " << line_num << ": " << errorArray[line_num] << endl << endl;
        }}
      | statement                     {if(errorInStatement){
        errorInStatement = false;
        cout << endl << ">> Error on line " << line_num << ": " << errorArray[line_num] << endl << endl;
        }}
      | INVALIDTOKEN                     {cout << "Invalid Token in line " << line_num << endl << endl;}
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
  errorInStatement = true;
  strcpy(errorArray[line_num], s);
}
