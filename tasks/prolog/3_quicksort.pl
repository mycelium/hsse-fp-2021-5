% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный

qsort([],[]).
qsort([H|T],Sorted):-
	split(H,T,Left,Right),
	qsort(Left,LSorted), qsort(Right,RSorted),
	append(LSorted,[H|RSorted],Sorted).

split(_,[],[],[]).
split(H,[X|T],[X|L],G):-
    X =< H, !,
    split(H,T,L,G).
split(H,[X|T],L,[X|G]):-
    X > H, !,
    split(H,T,L,G).

% ?- qsort([5, 1, 0, -4, 8, 11], K).
% K = [-4, 0, 1, 5, 8, 11] .

% ?- qsort([5, 1, 0, -4, 8, 11], [-4, 0, 1, 5, 8, 11]).
% true .