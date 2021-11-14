% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

qsort([Head|Tail], Sorted) :- pivoting(Head, Tail, Smaller, Bigger), 
                        qsort(Smaller, SortedSmaller),
                        qsort(Bigger, SortedBigger),
                        append(SortedSmaller, [Head|SortedBigger], Sorted).
qsort([], []).

pivoting(Head, [X|Tail], [X|Smaller], Bigger) :- X =< Head, 
                                            pivoting(Head, Tail, Smaller, Bigger).
pivoting(Head, [X|Tail], Smaller, [X|Bigger]) :- X > Head, 
                                            pivoting(Head, Tail, Smaller, Bigger).
pivoting(Head, [], [], []).

append([], X, X).
append([Head|X], Y, [Head|Z]) :- append(X, Y, Z).


balanced_tree(List, BalancedTree) :- 
    qsort(List, Sorted),
    build_tree(Sorted, BalancedTree).

build_tree(Sorted, instant(Root, LeftTree, RightTree)) :-
    length(Sorted, L),
    SubL is (L // 2),
    length(LeftList, SubL),
    append(LeftList, [Root|RightList], Sorted), % Левый список будет меньше или равен правому.
    build_tree(LeftList, LeftTree),
    build_tree(RightList, RightTree).
    
build_tree([], empty).


% ?- balanced_tree([5, 1, 3, 9, 7, 8, 2, 4, 6], Tree).
% Tree = instant(5, instant(3, instant(2, instant(1, empty, empty), empty), instant(4, empty, empty)), 
%         instant(8, instant(7, instant(6, empty, empty), empty), instant(9, empty, empty))) .

%               5
%       3               8
%   2       4       7       9
% 1   -   -   -   6   -   -   -