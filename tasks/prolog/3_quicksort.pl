% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный

partition_rec([LEFT | LIST], PIVOT, LEFT_LIST, [LEFT | RIGHT_LIST]) :- LEFT > PIVOT, partition_rec(LIST, PIVOT, LEFT_LIST, RIGHT_LIST).

partition_rec([LEFT | LIST], PIVOT, [LEFT | LEFT_LIST], RIGHT_LIST) :- LEFT =< PIVOT, partition_rec(LIST, PIVOT, LEFT_LIST, RIGHT_LIST).

partition_rec([],_, [], []).

q_partition(LIST, LEFT_LIST, PIVOT, RIGHT_LIST) :-
    % Last element of array is PIVOT. Could use any logic to determive PIVOT
    length(LIST, LEN), LAST is LEN-1,
    nth0(LAST, LIST, PIVOT),
    nth0(LAST, LIST, _, NEW_LIST),
    partition_rec(NEW_LIST, PIVOT, LEFT_LIST, RIGHT_LIST).


qsort(LIST, RESULT) :- member(_,LIST), q_partition(LIST, LEFT_LIST, PIVOT, RIGHT_LIST), qsort(LEFT_LIST, LEFT_RESULT), qsort(RIGHT_LIST, RIGHT_RESULT), append(LEFT_RESULT, [PIVOT|RIGHT_RESULT], RESULT).

qsort(_, []).
