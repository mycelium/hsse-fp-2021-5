% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

% функции из третьей лабки
qsort([], []).
qsort([H|Tail], K) :- 
	partition(H, Tail, Less, More),
	qsort(Less, SortedLess),
	qsort(More, SortedMore),
	append(SortedLess, [H|SortedMore], K).
	
partition(Pivot, [H|Tail], [H|Less], More) :- 
	H =< Pivot, 
	partition(Pivot, Tail, Less, More).
partition(Pivot, [H|Tail], Less, [H|More]) :- 
	H > Pivot,
	partition(Pivot, Tail, Less, More).
partition(_, [], [], []).


% работа с деревом
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
