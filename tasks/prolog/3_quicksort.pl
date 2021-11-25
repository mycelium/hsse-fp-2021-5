% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный 

qsort([],[]).

qsort([X|Tail], Sorted) :-
    split(X, Tail, Small, Big),
	qsort(Small, SortedSmall),
	qsort(Big, SortedBig),
	append(SortedSmall, [X|SortedBig], Sorted).

split(_, [], [], []).
split(X, [Y|Tail], [Y|Small], Big) :-
	X > Y,
	split(X, Tail, Small, Big).
split(X, [Y|Tail], Small, [Y|Big]) :-
	split(X, Tail, Small, Big).

% ? - qsort([10, 5, 0, 6, 8, -13], Sorted)
% K = [-13, 0, 5, 6, 8, 10]

% ? - qsort([10, 5, 0, 6, 8, -13], [-13, 0, 5, 6, 8, 10])
% K = true
