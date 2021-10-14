% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный 

split(Piv, [X|OtherNumbers], [X|Smaller], Bigger) :-
    X < Piv,
    split(Piv, OtherNumbers, Smaller, Bigger).
split(Piv, [X|OtherNumbers], Smaller, [X|Bigger]) :-
    X >= Piv,
    split(Piv, OtherNumbers, Smaller, Bigger).
split(_, [], [], []).
      
qsort(L, K) :-
    L = [Head|Tail],
    split(Head, Tail, X, Y),
    qsort(X, Xsort),
    qsort(Y, Ysort),
    append(Xsort, [Head|Ysort], K).
qsort([], []).

% ?- split(3, [0, 4, 2, 5], X, Y).
% X = [0, 2], Y = [4, 5]

% qsort([3, 0, 4, 2, 5], X).
% X = [0, 2, 3, 4, 5]
