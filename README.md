# some-language
## Learning how to create a programming language...  

To build the parser and run a file in.snazzle:  
```
bison -d snazzle.y
flex snazzle.l
g++ snazzle.tab.c lex.yy.c -0 snazzle
./snazzle
```

Credit to: http://aquamentus.com/flex_bison.html for being extremely helpful.  
