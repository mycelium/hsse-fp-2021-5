% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

qsort([], []).

qsort([H|T], K) :-
	partition(H, T, Smaller, Bigger),
	qsort(Smaller, SortedSmaller),
	qsort(Bigger, SortedBigger),
	append(SortedSmaller, [H|SortedBigger], K).

partition(Pivot, [H|T], [H|Smaller], Bigger) :-
	H =< Pivot,
	partition(Pivot, T, Smaller, Bigger).

partition(Pivot, [H|T], Smaller, [H|Bigger]) :-
	H > Pivot,
	partition(Pivot, T, Smaller, Bigger).

partition(_, [], [], []).

balanced_tree_impl([], empty).
balanced_tree_impl(List, instant(Root, LeftLeef, RightLeef)):-
	partition_for_tree(List, LeftList, [Root|RightList]),
	balanced_tree_impl(LeftList, LeftLeef),
	balanced_tree_impl(RightList, RightLeef).

balanced_tree(L, T):-
	qsort(L, SortedList),
	balanced_tree_impl(SortedList, T).

partition_for_tree(List, LeftList, RightList):-
	append(LeftList, RightList, List),
	length(List, Len),
	Half is Len div 2,
	length(LeftList, Half).