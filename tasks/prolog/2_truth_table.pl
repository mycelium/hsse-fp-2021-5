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

	and(A,B) :- A,B.
	or(A, B) :- A;B.
	xor(A, B) :- A \= B.
	not(A) :- \+ A.
	equ(A,B) :- A=B.
	
	bool(true).
	bool(fail).
	
	truth_table(A, B, Expression) :- 
		bool(A), bool(B),
		write(A), write("/t"), write(B), write("/t"),
		(Expression -> write("true"); write("fail")), nl,
		fail.