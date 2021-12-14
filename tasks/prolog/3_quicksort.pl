% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный 

pivot(_, [], [], []).
pivot(Pivot, [L|Tail], [L|LTE], GT) :- Pivot >= L, pivot(Pivot, Tail, LTE, GT). 
pivot(Pivot, [L|Tail], LTE, [L|GT]) :- pivot(Pivot, Tail, LTE, GT).

qsort([], []).
qsort([L|Tail], K) :- pivot(L, Tail, L1, L2), qsort(L1, K1), qsort(L2, K2), append(K1, [L|K2], K).

% Проверка:

% ?- qsort([3, 1, 2], [1, 2, 3]).
% true .

% ?- qsort([3, 1, 2], [2, 1, 3]).
% false.

% ?- qsort([7, 4, -2, 5, 0], K).
% K = [-2, 0, 4, 5, 7] .

% ?- qsort([3, 5, 7, -2, 67, -9, 0, 5, -1], K).
% K = [-9, -2, -1, 0, 3, 5, 5, 7, 67] .

