% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)


% --- Предикат qsort из предыдущего задания ---
qsort([],[]).   
qsort([X|Tail], SortedResult) :-         
	split_(X, Tail, Left, Right), qsort(Left, SortedLeft),
	qsort(Right, SortedRight), append(SortedLeft, [X|SortedRight], SortedResult).	
split_(X, [],[],[]).
split_(X, [Y|Tail], [Y|Left], Right) :- X > Y, split_(X, Tail, Left, Right).
split_(X, [Y|Tail], Left, [Y|Right]) :- split_(X, Tail, Left, Right).

% --- Доп ---
split_in_half(List, Left, Right):-
    append(Left, Right, List),
    length(List, ListLength),
    LengthHalf is div(ListLength, 2),
    length(Left, LengthHalf).

% --- balanced_tree ---
balanced_tree_kek([], empty).
balanced_tree_kek(List, instant(Root, Left, Right)) :-
	split_in_half(List, LeftList, [Root|RightList]),
	balanced_tree_kek(LeftList, Left),
	balanced_tree_kek(RightList, Right).

balanced_tree(List, Tree) :- qsort(List, SortedList), balanced_tree_kek(SortedList, Tree).
	
% --- Tree= instant(4, instant(2, instant(1, empty, empty), instant(3, empty, empty)), instant(6, instant(5, empty, empty), instant(7, empty, empty))) .