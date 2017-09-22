# Prolog-DCG
A definite clause grammar in prolog

## Top level predicate is: program/3
i.e., program( ParseTree, InputListOfTokens, [] )

## Example input program:
begin

const x = 8;

var y;

var z;

z := 0;

if x = y + 2 then z := 5 else z := 3 endif;

while not x = z do
z := z + 2
endwhile

end.

This program will be a list of tokens fed into program/3. 


?- L = [begin, const, x, =, 8, ;, var, y, ;, var, z, ;, z, :=, 0, ;, if, x, =, y, +, 2, then, z , := , 5, else, z, :=, 3, endif, ;, while, not, x, =, z, do, z, :=, z, +, 2, endwhile, end, .], 

program(P,L,[]).

## Successful completion:
P will be bound to the parse tree for the program L. 

## The grammar rules

P in Program

K in Block

D in Declaration

C in Command

E in Arithmetic Expression

B in Boolean Expression

I in Identifier

N in Number

P ::= K.

K ::= begin D; C end

D ::= const I = N; D | var I; D | const I = N | var I

C ::= I := E; C | if B then C else C endif; C | while B do C endwhile; C | K; C |

I := E | if B then C else C endif | while B do C endwhile | K B ::= true | false | E = E | not B

E ::= I + E | N + E | I ­ E | N ­ E | I * E | N*E | I / E | N / E | I | N I ::= x | y | z | u | v

N ::= 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9
