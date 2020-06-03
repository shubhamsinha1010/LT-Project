%{
#include<stdio.h>
#include "y.tab.h"
%}

%%
[0-9]+  {yylval.number=(float)atof(yytext);return NUMBER;}
[0-9]*\.[0-9]+ {yylval.number=(float)atof(yytext);return NUMBER;}
kg {return KILOGRAM;}
g {return GRAM;}
lb {return POUND;}
oz {return OUNCES;}
-> {return INTO;}

[\n] {return yytext;}
[/t] ;

%%
int yywrap(){return 1;}