% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

:- consult('3_quicksort.pl').

balanced_tree(L,T):- qsort(L,Sorted), build_tree(Sorted,T).

build_tree([],empty).
build_tree(L,instant(Root,Left,Right)):- divide(L,A,[Root|B]),
    build_tree(A,Left), build_tree(B,Right).

divide(List,L,R):- length(List,N),
    Half is N - N // 2,
    length(R,Half),
    append(L,R,List).
    
%?- balanced_tree([47, 38, 3, 91, 42, 42, 16, 8, 29], T).
%T = instant(38, instant(16, instant(8, instant(3, empty, empty), empty), instant(29, empty, empty)),
%    instant(47, instant(42, instant(42, empty, empty), empty), instant(91, empty, empty)))
%    
%В более читаемой форме:
%T = instant(38,
%              instant(16, 
%                        instant(8, 
%                                  instant(3, empty, empty), empty),
%                        instant(29, empty, empty)),
%              instant(47, 
%                        instant(42, 
%                                  instant(42, empty, empty), empty),
%                        instant(91, empty, empty)))
%
%          38
%    16          47
%   8  29      42  91
%  3         42