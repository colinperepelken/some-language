#include <iostream>
#include <string>
#include <sstream>
#include <algorithm>
#include <iterator>
#include "grammar.tab.h"

using namespace std;


enum Token {
  tok_eof = -1,

  tok_def = -2,
  tok_extern = -3,

  tok_identifier = -4,
  tok_number = -5,

  tok_print = -6
};

static string IdentifierString;
static double NumVal;

static int GetToken() {
  static int LastChar = ' ';

  while (isspace(LastChar)) {
    LastChar = getchar();
  }

  if (isalpha(LastChar)) {
    IdentifierString = LastChar;
    while (isalnum((LastChar = getchar()))) {
      IdentifierString += LastChar;
    }

    if (IdentifierString == "def") {
      return tok_def;
    }
    
    if (IdentifierString == "extern") {
      return tok_extern;
    }

    if (IdentifierString == "print") {
      return PRINT;
    }

    return STRING;
  }

  if (isdigit(LastChar) || LastChar == '.') {
    string NumStr;
    do {
      NumStr += LastChar;
      LastChar = getchar();
    } while (isdigit(LastChar) || LastChar == '.');

    NumVal = strtod(NumStr.c_str(), 0);
    return tok_number;
  }

  if (LastChar == '#') {
    do {
      LastChar = getchar();
    } while (LastChar != EOF  && LastChar != '\n' && LastChar != '\r');

    if (LastChar != EOF) {
      return GetToken();
    }
  }

  if (LastChar == EOF) {
    return tok_eof;
  }

  int thisChar = LastChar;
  LastChar = getchar();
  return thisChar;
}

int main() {
  cout << GetToken();
  
  
}