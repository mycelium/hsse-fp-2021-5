% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

:- consult('3_quicksort.pl').

balanced_tree(L, T) :- qsort(L, Sort), build_tree(Sort, T).

split(List, L, R) :- length(List, Length),
                     Half is Length // 2,
                     length(L, Half),
                     append(L, R, List).

build_tree([], empty).
build_tree(S, instant(R, Lt, Rt)) :- split(S, Left, [R|Right]),
                                           build_tree(Left, Lt),
                                           build_tree(Right, Rt).

