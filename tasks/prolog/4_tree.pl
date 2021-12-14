% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

% qsort Хоара из предыдущего задания

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

% ---------------------

split_in_half(List, L, R):-
    append(L, R, List),
    length(List, Len),
    HalfLen is div(Len, 2),
    length(L, HalfLen).

balanced_tree_dop([], empty).
balanced_tree_dop(List, instant(Root, L, R)) :-
    split_in_half(List, LL, [Root|RL]),
    balanced_tree_dop(LL, L),
    balanced_tree_dop(RL, R).

balanced_tree(List, Tree) :- qsort(List, SortedList), balanced_tree_dop(SortedList, Tree).