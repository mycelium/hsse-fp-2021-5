% определить предикаты:
	% and(A,B)
	% or(A, B)
	% xor(A, B)
	% not(A)
	% equ(A,B)
% ипользовать предикат truth_table(A,B, expression) для построения таблиц истинности, например:
% truth_table(A,B,and(A,or(A,B))).
% true true true
% true fail true
% fail true fail
% fail fail fail

and(A,B):- A,B.
or(A,B):- A;B.
xor(A,B):- and(or(A,B),or(not(A),not(B))).
not(A):- \+A.
equ(A,B):- \+xor(A,B).

boolval(true).
boolval(fail).

truth_table(A,B, Expression):- boolval(A), boolval(B), write(A), write(' '), write(B),
    							write(' '), (Expression -> write(true); write(fail)), nl.

%?- truth_table(A,B,and(A,or(A,B))).
%true true true
%true fail true
%fail true fail
%fail fail fail

%?- truth_table(A,B,or(not(xor(equ(A,B),B)),and(A,B))).
%true true true
%true fail true
%fail true fail
%fail fail fail