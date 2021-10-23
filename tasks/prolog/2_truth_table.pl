% определить предикаты:
	% and(A,B)
	% or(A, B)
	% xor(A, B)
	% not(A)
	% equ(A,B)

and(A, B) :- A , B.
or(A, B) :- A ; B.
% not(A) already defined
xor(A, B) :- (not(A), B) ; (A, not(B)).
equ(A, B) :- A == B.

bool(true).
bool(fail).

truth_table(A,B,Expression) :- 
	bool(A), 
	bool(B), 
	write(A), 
	write(' '), 
	write(B), 
	write(' '),
	(Expression -> write(true); write(fail)), % b -> c ; d. means (if b then c else d)
	nl,
	fail. % fail for skipping prolog output for variables

% использовать предикат truth_table(A,B, expression) для построения таблиц истинности

% truth_table(A, B, and(A,or(A,B))).
% true true true
% true fail true
% fail true fail
% fail fail fail

% truth_table(A, B, and(A, xor(A, not(B)))).
% true true true
% true fail fail
% fail true fail
% fail fail fail