% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный 

qsort([], []).

qsort([H|T], Sorted) :-
    split(H, T, Less, Greater),
    qsort(Less, SortedLess),
    qsort(Greater, SortedGreater),
    append(SortedLess, [H|SortedGreater], Sorted).

split(_, [], [], []).

split(P, [H|T], Less, [H|Greater]) :- 
    H > P, split(P, T, Less, Greater).

split(P, [H|T], [H|Less], Greater) :- 
    H =< P, split(P, T, Less, Greater). 
