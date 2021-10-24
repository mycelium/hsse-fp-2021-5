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

or(A, B) :- A; B.
and(A, B) :- A, B.
xor(A, B) :- (not(A), B); (A, not(B)).
equ(A, B) :- A = B.

boolean(true).
boolean(false).

truth_table(A, B, Expression) :- 
	boolean(A),
	boolean(B),
	write(A), write('\t'), 
	write(B), write('\t'),
	(Expression -> writeln(true); writeln(false)), 
	fail. 

% ?- truth_table(A, B, and(A, B)).
% true    true    true
% true    false   false
% false   true    false
% false   false   false

% ?- truth_table(A, B, and(equ(A, B), not(B))). 
% true    true    false
% true    false   false
% false   true    false
% false   false   true

% ?- truth_table(A, B, not(xor(A, B))).         
% true    true    true
% true    false   false
% false   true    false
% false   false   true
