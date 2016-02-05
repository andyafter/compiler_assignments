%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include <python2.7/Python.h>
#include "functions.h"
#include "symeng.h"
extern int yylex();
extern int yyparse();
extern FILE* yyin;
void test();
 void (*yyerror)(const char* s);
 void yyerror1(const char* s) ;
 void yyerror2(const char* s) ;
void listen_to_command();
%}

%union {
        int ival;
        float fval;
}

%token<ival> INT
%token<fval> FLOAT
%token PLUS MINUS MULTIPLY DIVIDE LEFT RIGHT POWER
%token SQRT FACTORIAL MOD PI FLOOR CEIL ABS
%token COS SIN TAN SINH COSH TANH COSH SINH LOG2 LOG10
%token NEWLINE QUIT ENDF
%token TEST
%left PLUS MINUS
%left MULTIPLY DIVIDE
%left EXPONENTIAL SQRT

%type<ival> expression
%type<fval> mixed_expression
%type<fval> function
%type<fval> log_function
%type<fval> trig_function
%type<fval> hyperbolic_function
%type<fval> constant
%start calculation

%%

calculation:
           | calculation line
;

constant: PI { $$ = 3.141592654; }
;

line: NEWLINE
    | mixed_expression NEWLINE { printf("\tResult: %f\n", $1);}
    | expression NEWLINE { printf("\tResult: %i\n", $1); }
    | QUIT NEWLINE { printf("bye!\n"); exit(0); }
    | ENDF {return 0;}
;

mixed_expression: FLOAT {$$ = $1;}
    | constant
    | function
    | mixed_expression PLUS mixed_expression  { $$ = $1 + $3; }
    | mixed_expression MINUS mixed_expression { $$ = $1 - $3; }
    | mixed_expression MULTIPLY mixed_expression { $$ = $1 * $3; }
    | mixed_expression DIVIDE mixed_expression { $$ = $1 / $3; }
    | mixed_expression POWER mixed_expression {$$ = pow($1, $3);}
    | LEFT mixed_expression RIGHT { $$ = $2; }
    | MINUS mixed_expression { $$ = -$2; }
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

expression: INT { $$ = $1; } // Here I put couple easier operations
    | expression PLUS expression { $$ = $1 + $3; }
    | expression MINUS expression { $$ = $1 - $3; }
    | expression MULTIPLY expression { $$ = $1 * $3; }
    | LEFT expression RIGHT { $$ = $2; }
;

function:
     mixed_expression FACTORIAL { $$ = factorial($1); }
    | SQRT expression { $$ = sqrt($2); }
    | SQRT mixed_expression { $$ = sqrt($2); }
    | expression MOD expression { $$ = modulo($1, $3); }
    | TEST {test();}
    | log_function
    | trig_function
    | hyperbolic_function
    | ABS expression { $$ = abs($2); }
    | FLOOR expression { $$ = floor($2); }
    | CEIL expression { $$ = ceil($2); }
    | ABS mixed_expression { $$ = abs($2); }
    | FLOOR mixed_expression { $$ = floor($2); }
    | CEIL mixed_expression { $$ = ceil($2); }
;

trig_function:
     COS expression { $$ = cos($2); }
    | SIN expression { $$ = sin($2); }
    | TAN expression { $$ = tan($2); }
    | SIN  mixed_expression { $$ = sin($2); }
    | COS mixed_expression { $$ = cos($2); }
    | TAN mixed_expression { $$ = tan($2); }
;

log_function:
    LOG2 expression { $$ = log2($2); }
    | LOG10 expression { $$ = log10($2); }
    | LOG2 mixed_expression { $$ = log2($2); }
    | LOG10 mixed_expression { $$ = log10($2); }
;

hyperbolic_function:
    COSH expression { $$ = cosh($2); }
    | SINH expression{ $$ = sinh($2); }
    | TANH expression{ $$ = tanh($2); }
    | COSH mixed_expression { $$ = cosh($2); }
    | SINH mixed_expression{ $$ = sinh($2); }
    | TANH mixed_expression{ $$ = tanh($2); }

;

%%
int main() {
  yyerror = yyerror1;
  listen_to_command(); // listening to command

  return 0;
}

void yyerror1(const char* s) {
  fprintf(stderr, "Parse error: %s\n", s);
  // direct jump out when parsing error....
  exit(1);
}

void yyerror2(const char* s) {
  fprintf(stderr, "End of File!\n", s);
  // direct jump out when parsing error....
  exit(1);
}

void listen_to_command(){
  yyin = stdin;
  do {
    yyparse();
  } while(!feof(yyin));
}


void test(){
  char* testfile = "test.txt";
  yyin = fopen(testfile, "r");
   yyerror = yyerror2;
    yyparse();
  printf("All Results from Test File!!\n");
}
