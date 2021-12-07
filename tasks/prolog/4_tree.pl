% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

qsort(L,K):-
		L = [Head|Tail],
		partition(Head, Tail, List1, List2),
		qsort(List1, Sorted1),
		qsort(List2, Sorted2),
		append(Sorted1, [Head|Sorted2], K).

qsort([], []).

partition(Current, [Head|Tail], [Head|LowEq], High):-
		Current >= Head,
		partition(Current, Tail, LowEq, High).

partition(Current, [Head|Tail], LowEq, [Head|High]):-
		partition(Current, Tail, LowEq, High).

partition(_, [], [], []).

split(List, Left, Right):-
	append(Left, Right, List),
	length(List, Len),
	Half is Len  div 2,
	length(Left, Half).

balanced_tree_impl([], empty).
balanced_tree_impl(List, instant(Root, LeftLeef, RightLeef)):-
	split(List, LeftList, [Root|RightList]),
	balanced_tree_impl(LeftList, LeftLeef),
	balanced_tree_impl(RightList, RightLeef).

balanced_tree(L, T):-
	qsort(L, SL),
	balanced_tree_impl(SL, T).
