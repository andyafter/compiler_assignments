all: calculator

calculator.tab.c calculator.tab.h: calculator.y
bison -d calculator.y

lex.yy.c: token.l calc.tab.h
flex token.l

calculator: lex.yy.c calculator.tab.c calculator.tab.h
gcc -o calculator calculator.tab.c lex.yy.c -lfl

clean:
rm calculator calculator.tab.c lex.yy.c calculator.tab.h
