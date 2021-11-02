% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный 

% Правило для алгоритма быстрой сортировки.
qsort([H|T], Result) :- partition(H, T, L, R),                  % Делим на две части.
                        qsort(L, Sorted_l),                     % Сортируем слева.
                        qsort(R, Sorted_r),                     % Сортируем справа.
                        append(Sorted_l, [H|Sorted_r], Result). % Соединяем.

% Обработка пустого списка.
qsort([], []).
partition(_, [], [], []).

% Правило для деления списка.
partition(H, [X|T], [X|L], R) :- X < H,
                                 !,
                                 partition(H, T, L, R).

partition(H, [X|T], L, [X|R]) :- partition(H, T, L, R).

/* Output.
    ?- qsort([6,5,1,2,4,0], Result).
    Result = [0, 1, 2, 4, 5, 6] ;
    false.

    ?- qsort([], Result).
    Result = [].

    ?- qsort([5], Result).
    Result = [5] ;
    false.
*/
