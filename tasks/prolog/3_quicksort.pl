% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный 

qsort([], []).
qsort(L, K) :- L=[P|_], filter(L,P,LessArr, BiggerArr, EquRes), qsort(LessArr, LessRes), qsort(BiggerArr, BiggerRes), append(LessRes, EquRes, NotBiggerRes), append(NotBiggerRes, BiggerRes, K).

% Разделить массив L на 3 массива: в одном элементы, меньше P, в другом элементы, больше P, в третьем элементы, равные P
filter(L, P, LessArr, BiggerArr, EquArr) :- L=[H|T], H<P, filter(T, P, LessNew, BiggerArr, EquArr), append(LessNew, [H], LessArr).
filter(L, P, LessArr, BiggerArr, EquArr) :- L=[H|T], H>P, filter(T, P, LessArr, BiggerNew, EquArr), append(BiggerNew, [H], BiggerArr).
filter(L, P, LessArr, BiggerArr, EquArr) :- L=[H|T], H=P, filter(T, P, LessArr, BiggerArr, EquNew), append(EquNew, [H], EquArr).
filter([],_,[],[],[]).

/*
?- qsort([1,-6,43,7,7,2,1],X).
X = [-6, 1, 1, 2, 7, 7, 43] .

?- qsort([-52, 2,5,2,-324,54],X).
X = [-324, -52, 2, 2, 5, 54] .

?- qsort([1,2,3,4],X).
X = [1, 2, 3, 4] .

?- qsort([-1,-2,-3,-4],X).
X = [-4, -3, -2, -1] .
*/