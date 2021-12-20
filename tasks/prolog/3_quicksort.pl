% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный

qsort([H|T], Sorted) :- pivoting(H, T, Smaller, Bigger),
                        qsort(Smaller, SortedSmaller),
                        qsort(Bigger, SortedBigger),
                        append(SortedSmaller, [H|SortedBigger], Sorted).
qsort([], []).

pivoting(H, [X|T], [X|Smaller], Bigger) :- X =< H,
                                            pivoting(H, T, Smaller, Bigger).
pivoting(H, [X|T], Smaller, [X|Bigger]) :- X > H,
                                            pivoting(H, T, Smaller, Bigger).
pivoting(H, [], [], []).

append([], X, X).
append([H|X], Y, [H|Z]) :- append(X, Y, Z).

% ?- qsort([5, 4, 3, 2, 1], Sorted).
% Sorted = [1, 2, 3, 4, 5]