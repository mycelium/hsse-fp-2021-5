% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

:- consult('3_quicksort.pl').

% balanced_tree
balanced_tree(L, T) :- qsort(L, K), build_tree(K, T).

% build_tree
build_tree([], empty).
build_tree(L, instant(X, T1, T2)) :- split(L, A, [X|B]), build_tree(A, T1), build_tree(B, T2).

% split
split(L, A, B) :- length(L, N), H is N - N // 2, length(B, H), append(A, B, L).

/*
swipl .\4_tree.pl

?- balanced_tree([1, 3, 6, 8, 10, 14], T).
T = instant(8, instant(3, instant(1, empty, empty), instant(6, empty, empty)), instant(14, instant(10, empty, empty), empty)) 

        8
      /   \
    3      14
  /   \       \
 1     6       10

*/
