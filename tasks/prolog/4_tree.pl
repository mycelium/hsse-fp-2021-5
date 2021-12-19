% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

qsort([], []).
qsort([X], [X]).
qsort([P|T], RES):-
    divide(T, P, X, Y),
    qsort(X, SortedX),
    qsort(Y, SortedY),!,
    append(SortedY, [P|SortedX], RES).

divide([], _, [], []) :- !.
divide([H|T], P, [H|X], Y):-
    H >= P, !, divide(T, P, X, Y).
divide([H|T], P, X, [H|Y]):-
    divide(T, P, X, Y).

create_tree([], empty).
create_tree(S, instant(Root, L, R)) :-
    separation(S, Left, [Root|Right]),
    create_tree(Left, L),
    create_tree(Right, R).

separation(X, L, R) :-
    length(X, Size),
    Half is (Size // 2),
    length(L, Half),
    append(L, R, X).

balanced_tree(L, T) :-
    qsort(L, S),
    create_tree(S, T).

% ?- balanced_tree([1, 3, 2, -2, 23,4], Res).
% Res = instant(3, instant(1, instant(-2, empty, empty), instant(2, empty, empty)), instant(23, instant(4, empty, empty), empty))
