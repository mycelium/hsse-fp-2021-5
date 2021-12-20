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

and(A, B) :- A, B.
or(A, B) :- A; B.
xor(A, B) :- (not(A), B) ; (A, not(B)).
equ(A, B) :- A == B.

boolean(true).
boolean(fail).

truth_table(A, B, Expression) :- boolean(A), boolean(B),
								(write(A), write(" "), write(B), write(" ")),
								(Expression -> write("true"); write("fail")),
								nl,
			                    fail.


?- truth_table(A,B,and(A,or(A,B))).
true true true
true fail true
fail true fail
fail fail fail
false.
