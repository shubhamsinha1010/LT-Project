%{
#include<stdio.h>
#include<math.h>
int yylex(void);
void yyerror(char *);
%}
%union{
float number;
}
%token <number> NUMBER FLOAT
%token KILOGRAM GRAM POUND OUNCES INTO
%type <number> S FUN1 FUN2 FUN3 FUN4  T
%%
S : T{$$=$1;printf("Result-%.5f",$$);};
T : KILOGRAM INTO FUN1{$$=$3;} |GRAM INTO FUN1{$$=$3;}|POUND INTO FUN1{$$=$3;}|OUNCES INTO FUN1{$$=$3;};

FUN1: GRAM NUMBER{$$=$2*1000;}| POUND NUMBER{$$=($2)/0.45359237;} | OUNCES NUMBER{$$=($2)/0.02834952;};
FUN2: KILOGRAM NUMBER{$$=($2)/1000;} | POUND NUMBER{$$=($2)/453.59237;} |OUNCES NUMBER {$$=($2)/28.34952;};
FUN3: KILOGRAM NUMBER{$$=$2*0.45359237;} |GRAM NUMBER{$$=$2*453.59237;}|OUNCES NUMBER {$$=$2*16;};
FUN4: KILOGRAM NUMBER{$$=$2*0.02834952;} | GRAM NUMBER{$$=$2*28.34952;} | POUND NUMBER{$$=($2)/16;};
%%
void yyerror(char *s)
{
fprintf(stderr, "%s\n",s);
}
int main(int argc,char *argv[])
{
int w;
printf("Weight COnversion:\n");
printf("Available Conversion are:-KILOGRAM GRAM POUND OUNCES ");
printf("Example :- 'KG -> g'\n");
printf("Enter Your Conversion :\n");
scanf("%f\n",&w);
yyparse();
return 0;
}

