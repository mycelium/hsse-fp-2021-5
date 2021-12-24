% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный 

qsort([], []).
qsort([H|T], S) :-
    split(H, T, L, G),
    qsort(L, SL),
    qsort(G, SG),
    append(SL, [H|SG], S).

split(_, [], [], []).
split(P, [H|T], L, [H|G]) :-
    H > P, split(P, T, L, G).
split(P, [H|T], [H|L], G) :-
    H =< P, split(P, T, L, G).
