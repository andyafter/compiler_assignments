%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "functions.h"
extern int yylex();
extern int yyparse();
extern FILE* yyin;
void yyerror(const char* s);
%}

%union {
        int ival;
        float fval;
}

%token<ival> INT
%token<fval> FLOAT
%token PLUS MINUS MULTIPLY DIVIDE LEFT RIGHT POWER
%token SQRT FACTORIAL
%token NEWLINE QUIT
%left PLUS MINUS
%left MULTIPLY DIVIDE
%left EXPONENTIAL SQRT

%type<ival> expression
%type<fval> mixed_expression
%type<fval> function
%start calculation

%%

calculation:
           | calculation line
;

line: NEWLINE
    | mixed_expression NEWLINE { printf("\tResult: %f\n", $1);}
    | expression NEWLINE { printf("\tResult: %i\n", $1); }
    | QUIT NEWLINE { printf("bye!\n"); exit(0); }
;

mixed_expression: FLOAT { $$ = $1; }
    | mixed_expression PLUS mixed_expression  { $$ = $1 + $3; }
    | mixed_expression MINUS mixed_expression { $$ = $1 - $3; }
    | mixed_expression MULTIPLY mixed_expression { $$ = $1 * $3; }
    | mixed_expression DIVIDE mixed_expression { $$ = $1 / $3; }
    | mixed_expression POWER mixed_expression {$$ = pow($1, $3);}
    | LEFT mixed_expression RIGHT { $$ = $2; }
    | expression PLUS mixed_expression { $$ = $1 + $3; }
    | expression MINUS mixed_expression { $$ = $1 - $3; }
    | expression MULTIPLY mixed_expression { $$ = $1 * $3; }
    | expression DIVIDE mixed_expression { $$ = $1 / $3; }
    | expression POWER mixed_expression {$$ = pow($1, $3);}
    | mixed_expression PLUS expression { $$ = $1 + $3; }
    | mixed_expression MINUS expression { $$ = $1 - $3; }
    | mixed_expression MULTIPLY expression { $$ = $1 * $3; }
    | mixed_expression DIVIDE expression { $$ = $1 / $3; }
    | mixed_expression POWER expression {$$ = pow($1, $3);}
    | expression DIVIDE expression { $$ = $1 / (float)$3; }
    | expression POWER expression {$$ = pow($1, $3);}
;

expression: INT { $$ = $1; }
    | function
    | expression PLUS expression { $$ = $1 + $3; }
    | expression MINUS expression { $$ = $1 - $3; }
    | expression MULTIPLY expression { $$ = $1 * $3; }
    | LEFT expression RIGHT { $$ = $2; }
;

function:
     expression FACTORIAL { $$ = factorial($1); }
    | SQRT expression { $$ = sqrt($2); }
;

%%
int main() {
  yyin = stdin;
  do {
    yyparse();
  } while(!feof(yyin));
  return 0;
}
void yyerror(const char* s) {
  fprintf(stderr, "Parse error: %s\n", s);
  // direct jump out when parsing error....
  exit(1);
}
