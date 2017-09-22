% Danielle Stewart
% Assignment 3
% April 9, 2015

num(n(0)) --> [0].
num(n(1)) --> [1].
num(n(2)) --> [2].
num(n(3)) --> [3].
num(n(4)) --> [4].
num(n(5)) --> [5].
num(n(6)) --> [6].
num(n(7)) --> [7].
num(n(8)) --> [8].
num(n(9)) --> [9].

id(i(x)) --> [x].
id(i(y)) --> [y].
id(i(z)) --> [z].
id(i(u)) --> [u].
id(i(v)) --> [v].

% Here is the program 
% P ::= K.

program(tprog(Tk)) --> block(Tk).

% Here is the block 
% K ::= begin D; C end

block(tblk(Tbegin, Td, Tsem, Tc, Tend)) --> blk(Tbegin), declaration(Td), blk(Tsem), command(Tc), blk(Tend).
blk(b(begin)) --> [begin].
blk(b(;)) --> [;].
blk(b(end)) --> [end].


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Here are the declarations (after eliminating left recursion)
% D ::= const I = N; D
% D ::= const I = N
% D ::= var I ; D
% D ::= var I

% const I = N ; D
declaration(tdec(Tconst, Ti, Teq, Tn, Tsem, Td)) --> dec(Tconst), id(Ti), dec(Teq), num(Tn),
					      dec(Tsem), declaration(Td).

% const I = N
declaration(tdec(Tconst, Ti, Teq, Tnum)) --> dec(Tconst), id(Ti), dec(Teq), num(Tnum).

% var I ; D
declaration(tdec(Tv, Ti, Tsem, Td)) --> dec(Tv), id(Ti), dec(Tsem), declaration(Td).

% var I
declaration(tdec(Tv, Ti)) --> dec(Tv), id(Ti).

dec(d(const)) --> [const].
dec(d(=)) --> [=].
dec(d(var)) --> [var].


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Here are the commands after eliminating left recursion
% C ::= I := E; C | if B then C else C endif ; C | while B do C endwhile ; C |
%	K ; C
% 
% C ::= I := E | if B then C else C endif | while B do C endwhile | K

% I := E ; C
command(tcom(Ti, Tseq, Te, Tsem, Tc)) --> id(Ti), com(Tseq), expression(Te), com(Tsem), command(Tc).

% if B then C else C endif ; C
command(tcom(Tif, Tb, Tthen, Tc1, Telse, Tc2, Tendif, Tsem, Tc)) -->
			com(Tif), boolean(Tb), com(Tthen), command(Tc1), com(Telse),
			command(Tc2), com(Tendif), com(Tsem), command(Tc).

% while B do C endwhile ; C
command(tcom(Twhile, Tb, Tdo, Tc, Tendwhile, Tsem, Tc)) -->
                        com(Twhile), boolean(Tb), com(Tdo), command(Tc), com(Tendwhile),
                        com(Tsem), command(Tc).

% K ; C
command(tcom(Tblk, Tsem, Tc)) --> block(Tblk), com(Tsem), command(Tc).

% I := E
command(tcom(Ti, Tseq, Te)) --> id(Ti), com(Tseq), expression(Te).

% if B then C else C endif
command(tcom(Tif, Tb, Tthen, Tc1, Telse, Tc2, Tendif)) -->
                        com(Tif), boolean(Tb), com(Tthen), command(Tc1), com(Telse),
                        command(Tc2), com(Tendif).

% while B do C endwhile
command(tcom(Twhile, Tb, Tdo, Tc, Tendwhile)) -->
                        com(Twhile), boolean(Tb), com(Tdo), command(Tc), com(Tendwhile).

% K
command(tcom(Tk)) --> block(Tk).

com(c(if)) --> [if].
com(c(then)) --> [then].
com(c(else)) --> [else].
com(c(endif)) --> [endif].
com(c(while)) --> [while].
com(c(do)) --> [do].
com(c(endwhile)) --> [endwhile].
com(c(:=)) --> [:=].
com(c(;)) --> [;].


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%
% Here are the booleans
% B ::= true | false | E = E | not B

% true | false
boolean(bo(true)) --> [true].
boolean(bo(false)) --> [false].

% E = E
boolean(tbool(Te1, Teq, Te2)) --> expression(Te1), bool(Teq), expression(Te2). 

% not B
boolean(tbool(Tnot, Tb)) --> bool(Tnot), boolean(Tb).

bool(bo(=)) --> [=].
bool(bo(not)) --> [not]. 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% And here are the expressions
% E ::= E+E | E-E | E*E | E/E | I | N 

% E+E
expression(texp(Te1, Tpl, Te2)) --> expression(Te1), exp(Tpl), expression(Te2).

% E-E
expression(texp(Te1, Tmi, Te2)) --> expression(Te1), exp(Tmi), expression(Te2).

% E*E
expression(texp(Te1, Tti, Te2)) --> expression(Te1), exp(Tti), expression(Te2).

% E\E
expression(texp(Te1, Tdi, Te2)) --> expression(Te1), exp(Tdi), expression(Te2).

% I
expression(texp(Ti)) --> id(Ti).

% N
expression(texp(Tn)) --> num(Tn).

exp(e(+)) --> [+].
exp(e(-)) --> [-].
exp(e(*)) --> [*].
exp(e(\)) --> [\].




