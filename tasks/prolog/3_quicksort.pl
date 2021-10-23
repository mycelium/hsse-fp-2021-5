% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный

qsort([], []).
qsort([Head|Tail], K) :- 
	partition(Head, Tail, Less, More),
	qsort(Less, SortedLess),
	qsort(More, SortedMore),
	append([SortedLess, [Head], SortedMore], K).
	
% Разбиение - делим список на две группы относительно опорного элемента
% Если элемент H меньше или равен опорному Pivot, то он идет в список Less
% Если элемент H больше опорного Pivot, то он идет в список More
partition(Pivot, [Head|Tail], [Head|Less], More) :- Head =< Pivot, partition(Pivot, Tail, Less, More).
partition(Pivot, [Head|Tail], Less, [Head|More]) :- Head > Pivot,  partition(Pivot, Tail, Less, More).
partition(_, [], [], []).
