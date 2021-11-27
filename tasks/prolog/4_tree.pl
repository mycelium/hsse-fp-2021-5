% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

:- consult('3_quicksort.pl').

divide(L, Left, Right):-
	length(L, Len),
	Mid is div(Len,2),
	length(Left, Mid),
	append(Left, Right, L).
	

make_tree(S, instant(R, Lt, Rt)) :-
	divide(S, Left, [R|Right]),
	make_tree(Left, Lt),
	make_tree(Right, Rt).
make_tree([], empty).

balanced_tree(L,T):- qsort(L, S), make_tree(S, T).



  


	

	