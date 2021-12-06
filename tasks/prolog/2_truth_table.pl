% определить предикаты:
	and(A, B) :- A, B.
	or(A, B) :- A ; B.
	xor(A, B) :- (not(A),B) ; (A, not(B)).
	% not(A) is the same as not(A).
	equ(A, B) :- A = B.
% ипользовать предикат truth_table(A,B, expression) для построения таблиц истинности, например:
% truth_table(A,B,and(A,or(A,B))).
% true true true
% true fail true
% fail true fail
% fail fail fail

bool(true).
bool(false).

truth_table(A, B, Expression) :-
    bool(A), bool(B),
	(write(A), write('\t'), write(B), write('\t')),
	(Expression -> write('true'); write('false')),
	nl, fail.
