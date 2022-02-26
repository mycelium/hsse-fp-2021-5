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

and(A,B):- A, B.
or(A,B):- A; B.
xor(A,B):- A, not(B); not(A), B.
equ(A,B):- A = B.

operand(true).
operand(fail).

truth_table(A,B,Expression):-
	operand(A), operand(B),
	write(A), write(" "), write(B), write(" "),
	(Expression -> write(true); write(fail)),
	write("\n"),
	fail.

/*
	?- truth_table(X, Y, and(X, Y)).
	true true true
	true fail fail
	fail true fail
	fail fail fail
	false.

	?- truth_table(X, Y, or(X, Y)).
	true true true
	true fail true
	fail true true
	fail fail fail
	false.

	?- truth_table(X, Y, xor(X, Y)).
	true true fail
	true fail true
	fail true true
	fail fail fail
	false.

	?- truth_table(X, Y, equ(X, Y)).
	true true true
	true fail fail
	fail true fail
	fail fail true
	false.
*/