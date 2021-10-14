% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный 

qsort([], []).
qsort([H|Tail], K) :- 
	partition(H, Tail, Less, More),
	qsort(Less, SortedLess),
	qsort(More, SortedMore),
	append(SortedLess, [H|SortedMore], K).
	
partition(Pivot, [H|Tail], [H|Less], More) :- 
	H =< Pivot, 
	partition(Pivot, Tail, Less, More).
partition(Pivot, [H|Tail], Less, [H|More]) :- 
	H > Pivot,
	partition(Pivot, Tail, Less, More).
partition(_, [], [], []).

