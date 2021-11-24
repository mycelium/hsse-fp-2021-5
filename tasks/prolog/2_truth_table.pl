% определить предикаты:
	% and(A,B)
	% or(A, B)
	% xor(A,B)
	% not(A)
	% equ(A,B)

and(A,B):- A, B.
or(A,B):- A; B.
xor(A,B):- or(and(A,not(B)),and(not(A),B)).
%not(A) - уже определен
equ(A,B):- or(and(not(A),not(B)),and(A,B)).
	
% ипользовать предикат truth_table(A,B, expression) для построения таблиц истинности, например:
% truth_table(A,B,and(A,or(A,B))).
% true true true
% true fail true
% fail true fail
% fail fail fail

boolean(true).
boolean(fail).

truth_table(A,B,Expression):- boolean(A), boolean(B), write(A), write(' '), write(B), write(' '), eval(Expression, X), write(X), nl, fail.
eval(Expression, true) :- Expression, !.
eval(Expression, fail).

% ?- truth_table(A,B,xor(A,B)).
% true true fail
% true fail true
% fail true true
% fail fail fail
% false.

% ?- truth_table(A,B,equ(A,B)).
% true true true
% true fail fail
% fail true fail
% fail fail true
% false.

% ?- truth_table(A,B,or(not(A),B)).
% true true true
% true fail fail
% fail true true
% fail fail true
% false.

% ?- truth_table(A,B,and(or(not(A),B),A)).
% true true true
% true fail fail
% fail true fail
% fail fail fail
% false.

% ?- truth_table(A,B,equ(and(or(not(A),B),A),not(B))).
% true true fail
% true fail fail
% fail true true
% fail fail fail
% false.
