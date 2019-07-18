%{
  #include "snazzle.tab.h"
  #include <string.h>
%}
%option noyywrap
%%
[ \t\n] ;
print          { return PRINT;  }
sNaZZle        { return SNAZZLE; }
type           { return TYPE; }
end            { return END; }
[0-9]+\.[0-9]+ { yylval.fval = atof(yytext); return FLOAT; }
[0-9]+         { yylval.ival = atoi(yytext); return INT; }
[a-zA-Z0-9]+   {
  yylval.sval = strdup(yytext);
  return STRING;
}
.              ;
%%
