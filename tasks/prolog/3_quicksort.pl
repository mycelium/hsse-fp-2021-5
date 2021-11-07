% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный
% L - in array, K - out array

qsort([],[]).
qsort([H|T], Q) :- 
	separate(H, T, Min, Maj), 
	qsort(Min, M1), 
	qsort(Maj, M2), 
	append(M1,[H|M2],Q).

%separate(Pivot, List, Minor, Major)
separate(_,[],[],[]).
separate(X,[A|B],[A|Min],Maj) :- 
	A =< X, 
	separate(X, B, Min, Maj).

separate(X,[A|B],Min,[A|Maj]) :- 
	A > X, 
	separate(X, B, Min, Maj).

%qsort([4, -1, 8, 3, 67, 99, 445, -119, 53], K).
%K = [-119, -1, 3, 4, 8, 53, 67, 99, 445] 