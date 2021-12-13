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

and(A,B) :- A,B.
or(A,B) :- A.
or(A,B) :- B.
xor(A,B) :- A\=B.
not(A) :- \+A.
equ(A,B) :- A=B.

bool(true).
bool(fail).

truth_table(A,B, Expression) :- bool(A), bool(B), line(A, B, Expression), fail.
line(A, B, Expression) :- Expression, write(A), write(" "), write(B), write(" true"), nl, !.
line(A, B, _) :- write(A), write(" "), write(B), write(" fail"), nl, !.

/*
?- truth_table(A,B,and(A,or(A,B))).
true true true
true fail true
fail true fail
fail fail fail

?- truth_table(A,B,equ(A,B)).
true true true
true fail fail
fail true fail
fail fail true

?- truth_table(A,B,xor(A,B)).
true true fail
true fail true
fail true true
fail fail fail

?- truth_table(A,B,or(A,B)).
true true true
true fail true
fail true true
fail fail fail

*/