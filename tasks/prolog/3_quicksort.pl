% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный 

divide(_, [],[],[]).
divide(X, [H|T], [H|Small], Big) :-
    X > H,
    divide(X, T, Small, Big).
divide(X, [H|T], Small, [H|Big]) :-
    divide(X, T, Small, Big).
	
qsort([],[]).   
qsort([H|T], Sorted) :-         
   divide(H, T, Small, Big),
    qsort(Small, SmallS),
    qsort(Big, BigS),
    append(SmallS, [H|BigS], Sorted).
