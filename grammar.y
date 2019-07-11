%{
    #include <stdio.h>

    extern yyparse()
%}

%union {
    int int_val;
    float float_val;
    char *string_val;
}

%token <int_val> INT
%token <float_val> FLOAT
%token <string_val> STRING
%token <string_val> PRINT


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
  | PRINT STRING {
      cout << $2; free($2);
  }
;

%%
int main()
{
    yyparse(); // Parse through the input.
    return 0;
}
