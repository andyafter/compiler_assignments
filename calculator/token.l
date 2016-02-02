%{
#include <stdio.h>

#define YY_DECL int yylex()

#include "calculator.tab.h"

%}

%%

[ \t]   ; // ignore all whitespace
[0-9]+\.[0-9]+  {yylval.fval = atof(yytext); return FLOAT;}
[0-9]+  {yylval.ival = atoi(yytext); return INT;}
\n {return NEWLINE;}
"+"  {return PLUS;}
"-"  {return MINUS;}
"*"  {return MULTIPLY;}
"**" {return POWER;}
"/"  {return DIVIDE;}
"("  {return LEFT;}
")"  {return RIGHT;}
"!"  { return FACTORIAL; }
; //("pi")|("PI") { return PI; }
; //("mod")|("MOD") { return MOD; }
; //("pow")|("POW") {	return POW; }
("sqrt")|("SQRT") { return SQRT; }

"exit"  {return QUIT;}
"quit"  {return QUIT;}

%%
