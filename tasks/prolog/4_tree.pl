% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

:- consult('3_quicksort.pl').

balanced_tree(L, T) :- qsort(L, Sorted), build_tree(Sorted, T).

build_tree([], empty).
build_tree(S, instant(Root, L, R)) :-
	split(S, Left, [Root | Right]),
	build_tree(Left, L),
	build_tree(Right, R).

split(List, L, R) :-
	length(List, Length),
	H is div(Length, 2),
	length(L, H),
	append(L, R, List).

/*
?- balanced_tree([1, 3, 6, 8, 11, 14], T).
T = instant(8, 
		instant(3, instant(1, empty, empty), instant(6, empty, empty)), 
		instant(14, instant(11, empty, empty), empty)
	) 
*/