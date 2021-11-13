% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный 


qsort([Head|Tail], Sorted) :- pivoting(Head, Tail, Smaller, Bigger), 
                        qsort(Smaller, SortedSmaller),
                        qsort(Bigger, SortedBigger),
                        append(SortedSmaller, [Head|SortedBigger], Sorted).
qsort([], []).

pivoting(Head, [X|Tail], [X|Smaller], Bigger) :- X =< Head, 
                                            pivoting(Head, Tail, Smaller, Bigger).
pivoting(Head, [X|Tail], Smaller, [X|Bigger]) :- X > Head, 
                                            pivoting(Head, Tail, Smaller, Bigger).
pivoting(Head, [], [], []).

append([], X, X).
append([Head|X], Y, [Head|Z]) :- append(X, Y, Z).

% ?- qsort([5, 1, 3, 9, 7, 8, 2, 4, 6], Sorted).
% Sorted = [1, 2, 3, 4, 5, 6, 7, 8, 9] 
