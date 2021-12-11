% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)
:- ['3_quicksort.pl'].
balanced_tree(L, T) :-
    qsort(L, SortedList),construct(SortedList, T).

balanced_tree([], empty).

build([], empty).
build(L, instant(R, LeftT, RightT)) :-
    split(L, LeftL, [R | RightSubl]),
    build(LeftL, LeftT),
    build(RightSubl, RightT).


split(L, LeftSubl, RightSubl) :-
    length(L, Length),
    HalfLength is div(Length, 2),
    length(LeftSubl, HalfLength),
    append(LeftSubl, RightSubl, L).
