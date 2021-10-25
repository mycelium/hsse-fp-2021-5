% Определить предикат qsort(L, K)
% который для заданного списка целых чисел возвращает отсортированный

qsort(L, K) :-
    L = [Pivot|_], %choose pivot
    split_list(L, Pivot, Left, PivotList, Right),
    qsort(Left, Lsorted),
    qsort(Right, Rsorted),
    append(Lsorted, PivotList, LeftPart),
    append(LeftPart, Rsorted, K).
qsort([],[]).

% args: List, pivot elem, 3 target lists
split_list([Head|Tail], Pivot, Left, PivotList, Right) :-
    Head < Pivot,
    split_list(Tail, Pivot, Nl, PivotList, Right),
    append(Nl, [Head], Left).
split_list([Head|Tail], Pivot, Left, PivotList, Right) :-
    Head > Pivot,
    split_list(Tail, Pivot, Left, PivotList, Nr),
    append(Nr, [Head], Right).
split_list([Head|Tail], Pivot, Left, PivotList, Right) :-
    split_list(Tail, Pivot, Left, Npl, Right),
    append(Npl, [Head], PivotList).
split_list([],_,[],[],[]).
