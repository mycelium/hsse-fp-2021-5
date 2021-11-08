% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

% ?- consult('3_quicksort.pl').

balanced_tree(L,T):-
    qsort(L,Sorted),
    build_tree(Sorted,T).

build_tree([],empty).
build_tree(L,instant(Root,Left,Right)):-
    div(L,A,[Root|B]),
    build_tree(A,Left),
    build_tree(B,Right).

div(L,A,K):-
    length(L,N),
    H is N - N // 2,
    length(K,H),
    append(A,K,L).

% ?- balanced_tree([2, 6, 9, 8, 11, 10, 3, 5], T).
% T = instant(8, instant(5, instant(3, instant(2, empty, empty), empty), instant(6, empty, empty)),
% instant(10, instant(9, empty, empty), instant(11, empty, empty)))