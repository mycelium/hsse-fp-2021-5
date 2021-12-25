% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

:- consult('3_quicksort.pl').

split(List, L, R):-
    append(L, R, List),
    length(List, ListLength),%get full length 
    LengthHalf is div(ListLength, 2),
    length(L, LengthHalf). %cut the list

balanced_tree([], empty).

balanced_tree(List, instant(Root, L, R)) :-
    split(List, LeftPart, [Root|RightPart]), %divide list [1,2,3,4] into LeftPart [1,2], Root 3, RightPart 4
    balanced_tree(LeftPart, L),
    balanced_tree(RightPart, R).

balanced_tree(L,T):- qsort(L, LSorted), balanced_tree(LSorted, T).

%
%?- balanced_tree([1, 2, 3, 4], TRee).
%TRee = instant(3, instant(2, instant(1, empty, empty), empty), instant(4, empty, empty)) .
%
