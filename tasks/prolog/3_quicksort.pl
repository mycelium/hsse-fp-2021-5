% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный
qsort([PIVOT|L], T):-  lomuto(L, PIVOT, LEFT, RIGHT), qsort(LEFT, L1), qsort(RIGHT, L2), append(L1,[PIVOT|L2], T).
qsort([],[]).

lomuto([X|L],PIVOT, [X|LEFT],RIGHT):- X < PIVOT, lomuto(L, PIVOT, LEFT, RIGHT).
lomuto([X|L],PIVOT, LEFT,[X|RIGHT]):- X >= PIVOT, lomuto(L, PIVOT, LEFT, RIGHT).
lomuto([],_,[],[]).