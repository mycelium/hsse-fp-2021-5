qsort([X|X_tail], X_sorted):-
	partition(X, X_tail, L, R),
    qsort(L, L_sorted),
    qsort(R, R_sorted),
	append(L_sorted, [X|R_sorted], X_sorted).

qsort([],[]).


partition(X, [Comp_elem|X_tail], [Comp_elem|L], R):-
    Comp_elem =< X,
    partition(X, X_tail, L, R).

partition(X,[Comp_elem|X_tail],L,[Comp_elem|R]):-
    Comp_elem > X,
    partition(X, X_tail, L, R).

partition(X,[],[],[]).


split_middle(X, L, R):-
	length(X, Len),
	Mid is div(Len, 2),
	length(L, Mid),
	append(L, R, X).


build_balanced_tree(List, instant(Root, L_tree, R_tree)) :-
	split_middle(List, L, [Root|R]),
	balanced_tree(L, L_tree),
	balanced_tree(R, R_tree).

build_balanced_tree([], empty).


balanced_tree(L, T) :-
	qsort(L, L_sorted),
	build_balanced_tree(L_sorted, T).





%?- balanced_tree([3,2,4],instant(3, instant(2, empty, empty), instant(4, empty, empty)))
%true