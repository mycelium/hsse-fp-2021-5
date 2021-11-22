% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный 

quicksort([],[]).

quicksort([X|Tail], Sorted) :-
    split(X, Tail, Small, Big),
	quicksort(Small, SortedSmall),
	quicksort(Big, SortedBig),
	append(SortedSmall, [X|SortedBig], Sorted).

split(_, [], [], []).
split(X, [Y|Tail], [Y|Small], Big) :-
	X > Y,
	split(X, Tail, Small, Big).
split(X, [Y|Tail], Small, [Y|Big]) :-
	split(X, Tail, Small, Big).

% ? - quicksort([10, 5, 0, 6, 8, -13], Sorted)
% K = [-13, 0, 5, 6, 8, 10]

% ? - quicksort([10, 5, 0, 6, 8, -13], [-13, 0, 5, 6, 8, 10])
% K = true
