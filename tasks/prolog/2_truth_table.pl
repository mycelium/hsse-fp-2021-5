% определить предикаты:
	% and(A,B)
	% or(A, B) -> !(!A * !B)
	% xor(A, B) -> (!A * B) + (A * !B)
	% not(A)
	% equ(A,B) -> !xor(A, B)
% ипользовать предикат truth_table(A,B, expression) для построения таблиц истинности, например:
% truth_table(A,B,and(A,or(A,B))).
% true true true
% true fail true
% fail true fail
% fail fail fail

and(A,B):- A, B.
not(A):- \+ A.
or(A,B):- not(and(not(A), not(B))).
xor(A,B):- or(and(not(A), B), and(A, not(B))).
equ(A,B):- not(xor(A, B)).


evaluate(E, true) :- E, !.
evaluate(_, false).

bool(true).
bool(false).

truth_table(A,B,Expression) :-
  bool(A),
  bool(B),
  write(A),
  write(' \t '),
  write(B),
  write(' \t '),
  evaluate(Expression, Result),
  write(Result),nl, fail.
