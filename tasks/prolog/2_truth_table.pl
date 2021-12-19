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

boolean(true).
boolean(false).
not(A):- \+ A.
and(A, B) :- A, B.
or(A, B) :- A; B.
xor(A, B) :- or((not(A), B), (A, not(B))).
equ(A,B) :- A == B.

truth_table(A, B, Expr) :-
	boolean(A),
	boolean(B),
	write(A), write(' '), write(B), write(' '),
	(Expr -> write(true); write(false)),
	nl,
	false.

% ?- truth_table(A, B, and(A, or(A, B))).
% true true true
% true false true
% false true false
% false false false
