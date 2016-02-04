OS := $(shell uname)

all: calculator

calculator.tab.c calculator.tab.h:     calculator.y
	bison -d calculator.y

lex.yy.c: token.l calculator.tab.h
	flex token.l

calculator: lex.yy.c calculator.tab.c calculator.tab.h
ifeq ($(OS), Darwin)
	g++  -o calculator calculator.tab.c lex.yy.c -ll
else
	g++ -o calculator calculator.tab.c lex.yy.c -lfl
endif

clean:
	rm calculator calculator.tab.c lex.yy.c calculator.tab.h
