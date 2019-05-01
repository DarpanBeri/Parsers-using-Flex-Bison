## Program Outline

Program reads a file named **ex.txt**, scans the input, and determines if the statement(s) in the file is/are valid.

* The Program shall print out the statement and print a pass/fail. Upon failure, print out why it failed.

### Grammar Stuff:

**Note:** All valid statements end with ";".

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
    * id op id {op id} -- any lenght as long as pairs of op and id are added.

* A parenthesis pair may be used to group any "id op id" combination.

id :== any combinations of digits and chars. The first character must be a char.

digit :== [0-9]

char :== [a-z,A-Z]

op :== +, -, *, /, %

others :== =, ;


### Valid Statements and their Breakdown:

- first = one1 + two2 - three3 / four4 ;
    
    id = id op id op id op id ;

- second = one1 * (two2 * three3) ;
    
    id = id op (id op id) ;

- second = one1 * (two2 * three3) ;
    
    id = id op (id op id) ;

- third = ONE + twenty - three3 ;
    
    id = id op id op id ;

- third = old * thirty2 / b567 ;
    
    id = id op id op id ;

- one1 * i8766e98e + bignum
    
    id op id op id

