% определить предикат mrg(L1, L2, R) который для двух отсортированных списков L1 и L2 
% определяет список R, составленный из этих элементов

mrg(L1, L2, R) :-
    sort_asc(L1, L1),
    sort_asc(L2, L2),
    !,
    mrg(L1, L2, R).

merge([], [], []).
merge(L1, [], L1).
merge([], L2, L2).
merge([H1|L1], [H2|L2], [H1|R]) :- H1 =< H2, merge(L1, [H2|L2], R).	
merge([H1|L1], [H2|L2], [H2|R]) :- H1  > H2, merge([H1|L1], L2, R).

sort_asc(List, Sorted) :- sort(0,  @=<, List,  Sorted).
