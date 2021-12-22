% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

:- consult('3_quicksort.pl').

balanced_tree(L,T) :- qsort(L, L_S), create_tree(L_S, T).

create_tree([], empty).
create_tree(S, instant(Main, L , R)) :- split_tree(S, L_T, [Main|R_T]), create_tree(L_T, L), create_tree(R_T, R).

split_tree(List, L, R) :- length(List, Length), Middle is div(Length, 2), length(L, Middle), append(L, R, List).


%  ?- balanced_tree([5, 3, 1, 7, 2, 4],Tree).
%  Tree = instant(4,
%  instant(2, instant(1, empty, empty),
%  	instant(3, empty, empty)),
%  instant(7, instant(5, empty, empty), empty))