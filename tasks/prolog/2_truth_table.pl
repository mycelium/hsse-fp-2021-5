% определить предикаты:
	% and(A,B)
	and(A,B):- A, B.
	% or(A, B)
	or(A,B):- A; B.
	% xor(A,B)
	xor(A,B):- or(and(A,not(B)),and(not(A),B)).
	% not(A) - уже определен
	% equ(A,B)
	equ(A,B):- or(and(not(A),not(B)),and(A,B))
	
% ипользовать предикат truth_table(A,B, expression) для построения таблиц истинности, например:
% truth_table(A,B,and(A,or(A,B))).
% true true true
% true fail true
% fail true fail
% fail fail fail

