###########################################################
#Name: Darpan Beri
#Project: Parsers-using-Flex-Bison
#File: Makefile
#Notes: Allows for easy compilation of the program.
###########################################################

#variables
BB=bison
FF=flex
CC=g++

all: exp

exp.tab.c exp.tab.h:	exp.y
	$(BB) -d exp.y

lex.yy.c: exp.l exp.tab.h
	$(FF) exp.l

exp: lex.yy.c exp.tab.c exp.tab.h
	$(CC) exp.tab.c lex.yy.c -Llfl -o exp
	export PATH="./:$PATH"

clean:
	rm exp exp.tab.c lex.yy.c exp.tab.h

#######################[ EOF: Makefile ]###################
