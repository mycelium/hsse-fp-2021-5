% определить предикаты:
	% and(A,B)
    and(A,B) :- A , B.
	% or(A, B)
	or(A, B) :- A ; B.
	% xor(A, B)
	xor(A, B) :- (not(A),B) ; (A,not(B)).
	% not(A)
	% equ(A,B)
	equ(A, B) :- A=B.
% ипользовать предикат truth_table(A,B, expression) для построения таблиц истинности, например:
% truth_table(A,B,and(A,or(A,B))).
% true true true
% true fail true
% fail true fail
% fail fail fail

truth_table(A,B,E):- E, write(A), write(" "), write(B), write(" "), write(true), nl, !.
truth_table(A,B,_):- write(A), write(" "), write(B), write(" "), write(false), nl, !.