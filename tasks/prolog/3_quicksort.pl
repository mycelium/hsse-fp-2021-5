% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный 
     
qsort([], []).
qsort([Elem], [Elem]).
qsort(L, K):-
    L = [Head|Tail],
    divide(Head, Tail, Left, Right),
    qsort(Left, LeftSort),
    qsort(Right, RightSort),
    append(LeftSort, [Head|RightSort], K).
    
divide(Head, [X|Tail], [X|Left], Right):- X < Head,
    divide(Head, Tail, Left, Right).
divide(Head, [X|Tail], Left, [X|Right]):- X >= Head,
    divide(Head, Tail, Left, Right).
divide(_, [], [], []).

%?- qsort([46, 17, -65, 83, 42, 42, 5],K).
%K = [-65, 5, 17, 42, 42, 46, 83] .