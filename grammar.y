%{
    #include <stdio.h>
%}

%union {
    int int_val;
    float float_val;
    char *string_val;
}

%token <int_val> INT
%token <float_val> FLOAT
%token <string_val> STRING


%%
// Grammar

statement:
  statement INT {
      cout << "bison found an int: " << $2 << endl;
    }
  | statement FLOAT {
      cout << "bison found a float: " << $2 << endl;
    }
  | statement STRING {
      cout << "bison found a string: " << $2 << endl; free($2);
    }
  | INT            {
      cout << "bison found an int: " << $1 << endl;
    }
  | FLOAT          {
      cout << "bison found a float: " << $1 << endl;
    }
  | STRING         {
      cout << "bison found a string: " << $1 << endl; free($1);
    }
  ;

print:

%%
int main()
{
    yyparse(); // Parse through the input.
    return 0;
}
