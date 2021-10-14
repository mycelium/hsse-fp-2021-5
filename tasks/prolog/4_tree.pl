% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

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

split_in_half(L, Half1, Half2) :- split_in_half(L, L, Half1, Half2).
split_in_half([_|[_|Tail]], [H|T], [H|T2], Half2) :- split_in_half(Tail, T, T2, Half2).
split_in_half([], L, [], L).
split_in_half([_|[]], L, [], L).

instant(_, empty, empty).
add(instant(Root, L, R), X, instant(Root, Lnew, R)) :- X =< Root, add(L, X, Lnew).
add(instant(Root, L, R), X, instant(Root, L, Rnew)) :- X > Root, add(R, X, Rnew).
add(empty, X, instant(X, empty, empty)).

add_all(L, T, Tnew) :- 
    split_in_half(L, Half1, [R|Half2]), 
    add(T, R, T2), 
    add_all(Half1, T2, T3),
    add_all(Half2, T3, Tnew).
add_all([], T, T).

balanced_tree(L, T) :- qsort(L, Lsort), add_all(Lsort, empty, T).

% ?- balanced_tree([3, 0, 4, 2, 5, 1, 6], T).
% T = instant(3, instant(1, instant(0, empty, empty), instant(2, empty, empty)), instant(5, instant(4, empty, empty), instant(6, empty, empty)))
