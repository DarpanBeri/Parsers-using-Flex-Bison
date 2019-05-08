<!-----------------------------------------------------------------
 Name: Darpan Beri(cssc0429, Red id: 820880704)
 Project: CS530 Assignment 3
 File: README.md
 Notes: A README file describing the program and detailing its files.
--------------------------------------------------------------------->

# CS530 ,Spring 2019 Assignment3
### Darpan Beri(cssc0429, Red id: 820880704)

#### The Program:
    A simple parser that can evaluate statements based of grammar specified below.

#### Grammar Specifications:
    exp: statements

    statements: statements statement
                | statement

    statement:  assignment
                | correctExpression

    assignment: ID = expression ;

    correctExpression: expression ;

    expression: expression OP ( expression )
                | expression OP ID
                | ID

    ID: Any combinations of chars and digits but the first character has to be a char.

    OP: '+','-','*','/','%'

    **Note**:
      The above is pseudocode and not the exact code used in exp.y. Also note the use of ';', that is accurate to exp.y's grammar.

#### Files Included:

**exp.l**:

    File containing instructions for flex, to identify tokens and send it to GNU Bison file.

**exp.y**:

    File containing instructions and grammar for GNU Bison to analyze the input and check if a line of text is valid according to the grammar.

**ex.txt**:

    My test file.

**Makefile**:

    Script for easier compilation of this program.

**README.md**:

    A README file describing the program and detailing its files.

#### Compilation Instructions:

**Make Instructions:**

    make all:
    	Compiles the program

    make clear:
    	Deletes additional files created in make.

**Running the Program:**

    make all
    exp

#### Operating Instructions:

**Required Software**:

    The system must be a UNIX based system with C, C compiler, Flex and GNU Bison installed.

#### Significant Design Decisions:
    The program is made with Flex and Bison instead of C++.

#### Extra features:

    None.

#### Known Deficiencies and Bugs:

    * The lexical defininiton of ID considers numbers as ID. Example, 666 is a valid ID.
    * The program considers 'ID;' as valid ID. Example, one + delta; is valid.

#### Lessons Learned:
* Learning a new language does not take long if one knows the core concepts behind most languages.
* There are many powerful tools available which most individuals ignore.
* Making a compiler is cool and frustrating.
<!-----------------------------------------[ EOF: README.md ]--------------------------------->
