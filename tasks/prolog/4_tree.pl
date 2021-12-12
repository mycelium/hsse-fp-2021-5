% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

:- consult('3_quicksort.pl').

balanced_tree(L,T):- qsort(L, Sorted), tree(Sorted, T).

tree([], empty).
tree(S, instant(Root, Ltree, Rtree)):- halve(S, Left, [Root|Right]), tree(Left, Ltree), tree(Right, Rtree).

halve(List, L, R):- length(List, Len), Half is div(Len,2), length(L, Half), append(L, R, List).

% ?- balanced_tree([1,564,56,54,4,7,23,678],Tree).
% Tree = instant(54,
        %instant(7, instant(4, instant(1, empty, empty), empty), instant(23, empty, empty)), 
        %instant(564, instant(56, empty, empty), instant(678, empty, empty)))