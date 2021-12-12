% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный

qsort([],[]).
qsort([H|T], Q) :- sep(H, T, Min, Maj), qsort(Min, M1), qsort(Maj, M2), append(M1,[H|M2],Q).

%sep(Pivot, List, Minor, Major)
sep(_,[],[],[]).
sep(X,[A|B],[A|Min],Maj):- A=<X, sep(X, B, Min, Maj).
sep(X,[A|B],Min,[A|Maj]):- A>X, sep(X, B, Min, Maj).

%?- qsort([1,67,56,34,62,76,2,7,12], Result).
    % Result = [1, 2, 7, 12, 34, 56, 62, 67, 76] 