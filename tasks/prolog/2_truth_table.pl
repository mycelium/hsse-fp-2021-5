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
or(A, B) :- \+and(\+A, \+B).
xor(A, B) :- or(A, B), \+and(A, B).
not(A) :- \+A.
equ(A, B) :- not(xor(A, B)).

bool(true).
bool(false).
res(E, true) :- E, !.
res(_, false).

truth_table(A, B, E) :- 
    bool(A),
    bool(B),
    res(E, R),
    write(A), write(" "), write(B), write(" "), write(R), nl,
    fail.

% ?- truth_table(A, B, and(A, B)).
% true true true
% true false false
% false true false
% false false false

% ?- truth_table(A, B, or(A, B)).
% true true true
% true false true
% false true true
% false false false

% ?- truth_table(A, B, xor(A, B)).
% true true false
% true false true
% false true true
% false false false

% ?- truth_table(A, B, equ(A, B)).
% true true true
% true false false
% false true false
% false false true