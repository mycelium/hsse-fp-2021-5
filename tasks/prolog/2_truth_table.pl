% определить предикаты:
	% and(A,B)
	% or(A, B)
	% xor(A, B)
	% not(A)
	% equ(A,B)
	
	and(A,B):-A,B.
	or(A,B):-A;B.
	xor(A,B):- A\=B.
	not(A) :- A,!,fail.
	not(_) :- true.
	equ(A,B):-not(xor(A,B)).
	
% иcпользовать предикат truth_table(A,B, expression) для построения таблиц истинности, например:
% truth_table(A,B,and(A,or(A,B))).
% true true true
% true fail true
% fail true fail
% fail fail fail

eval(E, true) :- E, !.
eval(_, fail).

bool(true).
bool(fail).

truth_table(A,B,E) :-
  bool(A),
  bool(B),
  write(A),
  write(' \t '),
  write(B),
  write(' \t '),
  eval(E, Result),
  write(Result),nl, fail.