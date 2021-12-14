% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный 

% Замечание. Для простоты выбираем первый элемент (см. сортировка Хоара)

qsort([], []).
qsort([H|T], K) :- 
    partition(H, T, Less, More),
    qsort(Less, SortedLess),
    qsort(More, SortedMore),
    append([SortedLess, [H], SortedMore], K).

% из одного списка формируем два путём проверки на неравенство элементов списка опорным
partition(Pivot, [H|T], [H|Less], More) :- H =< Pivot, partition(Pivot, T, Less, More).
partition(Pivot, [H|T], Less, [H|More]) :- H > Pivot,  partition(Pivot, T, Less, More).
partition(_, [], [], []).