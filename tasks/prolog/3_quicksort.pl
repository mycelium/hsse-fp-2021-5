% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный 

qsort([], []).
qsort([Head|Tail], K) :- 
	partition(Head, Tail, Less, More),
	qsort(Less, SortedLess),
	qsort(More, SortedMore),
	append([SortedLess, [Head], SortedMore], K).
	
% Формируем два списка путем сравнивания с опорным элементом
partition(Pivot, [Head|Tail], [Head|Less], More) :- Head =< Pivot, partition(Pivot, Tail, Less, More).
partition(Pivot, [Head|Tail], Less, [Head|More]) :- Head > Pivot,  partition(Pivot, Tail, Less, More).
partition(_, [], [], []).
