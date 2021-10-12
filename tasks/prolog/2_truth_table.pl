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

and(A,B) :- A, B.

or(A,_) :- A,!.
or(_,B) :- B.

xor(A,B) :- not(equ(A,B)).

equ(A,B) :- or(and(A,B), and(not(A),not(B))).

bind(true).
bind(fail).

truth_table(A,B,Expr) :- bind(A), bind(B), do(A,B,Expr), fail.

do(A,B,_) :- write(A), write('  '), write(B), write('  '), fail.
do(_,_,Expr) :- Expr, !, write(true),nl.
do(_,_,_) :- write(fail), !,nl.