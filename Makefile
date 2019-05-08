###########################################################
#Name: Blake Meyers(cssc0430, Red id: 819557369), Darpan Beri(cssc0429, Red id: 820880704), Zach Selchau(cssc0418, Red id: 820533188)
#Project: CS530 Assignment 2
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
