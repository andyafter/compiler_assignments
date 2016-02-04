%{
#include <stdio.h>

#define YY_DECL int yylex()

#include "calculator.tab.h"

%}

%%


[ \t]
"0x"[0-9a-f]{1,8} {yylval.ival = (int)strtol(yytext, NULL, 16); return INT;}
(([1-9][0-9]*\.?[0-9]*)|(\.[0-9]+))([Ee][+-]?[0-9]+)?  {yylval.fval = atof(yytext); return FLOAT;}
[0-9]+  {yylval.ival = atoi(yytext); return INT;}
[\n] {return NEWLINE;}
<<EOF>> {return ENDF;}
"+"  {return PLUS;}
"-"  {return MINUS;}
"*"  {return MULTIPLY;}
"**" {return POWER;}
"/"  {return DIVIDE;}
"("  {return LEFT;}
")"  {return RIGHT;}
"!"  { return FACTORIAL; }
("pi")|("PI") { return PI; }
("mod")|("MOD") { return MOD;}
("sqrt")|("SQRT") { return SQRT; }
"test" {return TEST;}
("floor")|("FLOOR") { return FLOOR; }
("ceil")|("CEIL") { return CEIL; }
("abs")|("ABS") { return ABS; }
("cos")|("COS") { return COS; }
("sin")|("SIN") { return SIN; }
("tan")|("TAN") { return TAN; }
("sinh")|("SINH") { return SINH; }
("cosh")|("COSH") { return COSH; }
("tanh")|("TANH") { return TANH; }
("sqrt")|("SQRT") { return SQRT; }
("log2")|("LOG2") { return LOG2; }
("log10")|("LOG10") { return LOG10; }

"exit"  {return QUIT;}
"quit"  {return QUIT;}

%%
