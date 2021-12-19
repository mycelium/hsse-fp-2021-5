% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный 

qsort([], []).
qsort([X], [X]).
qsort([P|T], RES):-
  divide(T, P, X, Y),
  qsort(X, SortedX),
  qsort(Y, SortedY), !,
  append(SortedY, [P|SortedX], RES).

divide([], _, [], []) :- !.
divide([H|T], P, [H|X], Y) :- H >= P, !, divide(T, P, X, Y).
divide([H|T], P, X, [H|Y]) :- divide(T, P, X, Y).


% ?- qsort([1, 3, 2, -2, 23, 4], Res).
% Res = [-2, 1, 2, 3, 4, 23].
