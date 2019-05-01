## Program Outline

Program reads a file named **ex.txt**, scans the input, and determines if the statement(s) in the file is/are valid.

* The Program shall print out the statement and print a pass/fail. Upon failure, print out why it failed.

### Grammar Stuff:

**Note:**
    * id :== identifire
    * exp :== expression
    * op :== operator
    * char :== charcter

* The only two valid statements are:
    * Assignment
    * Expression

* The format of Assignment is:
    * id = exp;

* The format of Expression is:
    * id op id {op id} -- any lenght as long as paurs of op and id are added.