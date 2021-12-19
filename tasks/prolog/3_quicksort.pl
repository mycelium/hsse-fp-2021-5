% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный 

qsort([], []).
qsort([X], [X]).
qsort([P|T], RES):-
  divide(T, P, X, Y),
  qsort(X, SortedX),
  qsort(Y, SortedY),!,
  append(SortedY, [P|SortedX], RES).

% ?- qsort([1, 3, 2, -2, 23,4], Res).
% Res = [-2, 1, 2, 3, 4, 23].
