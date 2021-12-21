% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный

qsort([], []).
qsort([L_H|L_T], K) :- partition(L_H, L_T, L, R), qsort(L, K_L), qsort(R, K_R), append(K_L, [L_H|K_R], K).

partition(_,[],[],[]).
partition(L_H, [X|T1],[X|T2], G) :- X=<L_H, partition(L_H, T1, T2, G).
partition(L_H, [X|T1], T2, [X|G]) :- X>L_H, partition(L_H, T1, T2, G).

% qsort([9, 100, 1, 10, 4], K).
% K = [1, 4, 9, 10, 100]