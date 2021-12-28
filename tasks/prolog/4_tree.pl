% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный
% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)
qsort([],[]).
qsort([Z|E], Q) :- separate(Z, E, Min, Maj), qsort(Min, M1), qsort(Maj, M2), append(M1,[Z|M2],Q).

separate(_,[],[],[]).
separate(X,[A|B],[A|Min],Maj) :- A =< X, separate(X, B, Min, Maj).
separate(X,[A|B],Min,[A|Maj]) :- A > X, separate(X, B, Min, Maj).

separate_in_half(List, Left, Right):-
    append(Left, Right, List),
    length(List, ListLength),
    LengthHalf is div(ListLength, 2),
    length(Left, LengthHalf).

btree([], empty).
btree(List, instant(Root, L, R)):-
      separate_in_half(List, LH, [Root|RH]),
      btree(LH, L),
      btree(RH, R).

balanced_tree(L, Out) :-
	qsort(L, R),
	btree(R, Out).

% ?- balanced_tree([], T).
% T = empty

% ?- balanced_tree([100, -9, 5, -200, 4, 599, 400], Out).
% Out = instant(5, instant(-9, instant(-200, empty, empty), instant(4, empty, empty)), instant(400, instant(100, empty, empty), instant(599, empty, empty)))