% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

:- consult('3_quicksort.pl').

split(List, L, R):-
    append(L, R, List),
    length(List, ListLength),
    LengthHalf is div(ListLength, 2),
    length(L, LengthHalf).

balanced_tree([], empty).

balanced_tree(List, instant(Root, L, R)) :-
	split(List, LeftList, [Root|RightList]),
	balanced_tree(LeftList, L),
	balanced_tree(RightList, R).
	
balanced_tree(List, Tree) :-
	qsort(List, SortedList),
	balanced_tree(SortedList, Tree).
