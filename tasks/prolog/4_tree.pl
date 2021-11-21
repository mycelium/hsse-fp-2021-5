% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

:- ['3_quicksort.pl'].

balanced_tree([], empty).

balanced_tree(List, Tree) :-
    qsort(List, SortedList),
    construct(SortedList, Tree).

construct([], empty).
construct(List, instant(Root, LeftTree, RightTree)) :-
    split(List, LeftList, [Root | RightSublist]),
    construct(LeftList, LeftTree),
    construct(RightSublist, RightTree).


split(List, LeftSublist, RightSublist) :-
    length(List, Length),
    HalfLength is div(Length, 2),
    length(LeftSublist, HalfLength),
    append(LeftSublist, RightSublist, List).

% ?- balanced_tree([10, 19, 11, 30, 17, 37, 31, 38], T). 
% T = instant(30, instant(17, instant(11, instant(10, empty, empty), empty), instant(19, empty, empty)), instant(37, instant(31, empty, empty), instant(38, empty, empty))) 
% instant(30, 
%     instant(17, 
%         instant(11, 
%             instant(10, empty, empty), 
%             empty
%         ), 
%         instant(19, empty, empty)
%     ), 
%     instant(37, 
%         instant(31, empty, empty), 
%         instant(38, empty, empty)
%     )
% ) 