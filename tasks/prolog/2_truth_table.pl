% определить предикаты:
	% and(A,B)
        and(A, B) :- A, B.

	% or(A, B)
        or(A, _) :- A.
        or(_, B) :- B.
	% xor(A, B)
        xor(A, B) :- A, not(B).
        xor(A, B) :- not(A), B.
	% not(A)
        % Системно определен
	% equ(A,B)
        equ(A, B) :- and(A, B).
        equ(A, B) :- and(not(A), not(B)).
% ипользовать предикат truth_table(A,B, expression) для построения таблиц истинности, например:
% truth_table(A,B,and(A,or(A,B))).
% true true true
% true fail true
% fail true fail
% fail fail fail

and(A, B) :- A, B.
or(A, _) :- A.
or(_, B) :- B.
xor(A, B) :- A, not(B).
xor(A, B) :- not(A), B.
equ(A, B) :- and(A, B).
equ(A, B) :- and(not(A), not(B)).

boolean(true).
boolean(fail).

truth_table(A, B, Expr) :- boolean(A), boolean(B),
								(write(A), write(" "), write(B), write(" ")),
								(Expr -> write("true"); write("fail")),
								nl,
			                    fail.

?- truth_table(A,B,xor(A,or(A,B))).
% true true fail
% true fail fail
% fail true true
