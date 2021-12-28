% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

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

split(List, L, R):-
    append(L, R, List),
    length(List, ListLength),
    LengthHalf is div(ListLength, 2),
    length(L, LengthHalf).

balanced_tree([], empty).

balanced_tree(List, instant(Root, L, R)) :-
    split(List, LeftPart, [Root|RightPart]),
    balanced_tree(LeftPart, L),
    balanced_tree(RightPart, R).

balanced_tree(L,T):- qsort(L, LSorted), balanced_tree(LSorted, T).
