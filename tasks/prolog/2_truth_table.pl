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
xor(A, B) :- A, not(B); B, not(A).
equ(A, B) :- A = B.

value(true).
value(false).

truth_table(A, B, Expression) :- value(A), value(B), write(A), write(" "), write(B), write(" "),
(Expression -> write("true"); write("fail")),
write('\n'),
false.

% truth_table(A,B,and(A,or(A,B))).
% true true true
% true false true
% false true fail
% false false fail
% false.
