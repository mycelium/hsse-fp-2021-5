% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный 

qsort([],[]).

qsort([X|T], SortedResult) :-         
	qsplit(X, T, L, R),
	qsort(L, SortedLeft),
	qsort(R, SortedRight),
	append(SortedLeft, [X|SortedRight], SortedResult).

qsplit(X, [],[],[]).
qsplit(X, [Y|T], [Y|L], R) :- X > Y, qsplit(X, T, L, R).
qsplit(X, [Y|T], L, [Y|R]) :- qsplit(X, T, L, R).
