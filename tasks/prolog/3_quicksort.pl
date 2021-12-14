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








%?- qsort([3,2,4],[2,3,4])
%true