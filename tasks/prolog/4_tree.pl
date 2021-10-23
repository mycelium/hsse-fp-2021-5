% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

:- consult('3_quicksort.pl').

list_median(List, Left, Root, Right) :-
	append([Left, [Root], Right], List),
	length(List, FullLength),
	HalfLength is div(FullLength, 2),
	length(Left, HalfLength),
	(length(Right, HalfLength); length([Root | Right], HalfLength)).

balanced_tree([], empty).

balanced_tree(List, instant(Root, L, R)) :-
	list_median(List, LeftList, Root, RightList),
	balanced_tree(LeftList, L),
	balanced_tree(RightList, R).

balanced_tree(List, Tree) :-
	qsort(List, SortedList),
	balanced_tree(SortedList, Tree).


% ?- balanced_tree([1,2,3,4,5,9], Tree).
% Tree = instant(4, 
% 			instant(2, 
% 				instant(1, empty, empty), 
% 				instant(3, empty, empty)
% 			), 
% 			instant(9, 
% 				instant(5, empty, empty), 
% 				empty
% 			)
% 		).

% ?- balanced_tree([1,2,3,10,4], Tree).
% Tree = instant(3, 
% 			instant(2, 
% 				instant(1, empty, empty), 
% 				empty
% 			), 
% 			instant(4, 
% 				instant(10, empty, empty), 
% 				empty
% 			)
% 		).