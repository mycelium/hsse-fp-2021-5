% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный 

qsort([],[]).
qsort([Z|E], Q) :-
	separate(Z, E, Min, Maj),
	qsort(Min, M1),
	qsort(Maj, M2),
	append(M1,[Z|M2],Q).

separate(_,[],[],[]).
separate(X,[A|B],[A|Min],Maj) :-
	A =< X,
	separate(X, B, Min, Maj).

separate(X,[A|B],Min,[A|Maj]) :-
	A > X,
	separate(X, B, Min, Maj).

%qsort([100, -9, 5, -200, 4, 599, 400], Out).
%Out = [-200, -9, 4, 5, 100, 400, 599]