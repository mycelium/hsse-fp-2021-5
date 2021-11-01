% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

:- consult('3_quicksort.pl').

balanced_tree(L,T) :- qsort(L, Sorted), build_tree(Sorted, T).

build_tree([], empty).
build_tree(S, instant(Root, Ltree, Rtree)) :-
	halve(S, Left, [Root|Right]),
	build_tree(Left, Ltree),
	build_tree(Right, Rtree).

halve(List, L, R) :-
	length(List, Len),
	Half is div(Len,2),
	length(L, Half),
	append(L, R, List).

% ?- balanced_tree([],Tree).
% Tree = empty
% 
% ?- balanced_tree([7,0,2,1,7,4,10,3,6,5,9],Tree).
% Tree = instant(5, instant(2, instant(1, instant(0, empty, empty), empty), instant(4, instant(3, empty,
% empty), empty)), instant(7, instant(7, instant(6, empty, empty), empty), instant(10, instant(9, empty,
% empty), empty)))
%
% С табами выглядело бы так:
% Tree = instant(5,
%                instant(2,
%                        instant(1, instant(0, empty, empty), empty),
%                        instant(4, instant(3, empty, empty), empty)
%                        ),
%                instant(7,
%                        instant(7, instant(6, empty, empty), empty),
%                        instant(10, instant(9, empty, empty), empty)
%                        )
%                )
% 
% Само дерево:
%               5
%       2               7
%   1      4       7        10
% 0  --   3  --   6  --   9   --
