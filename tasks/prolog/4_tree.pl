% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

:- ['3_quicksort.pl'].

balanced_tree(L, T)  :- qsort(L, K), tree_build(K, T).

tree_build(L, instant(H, T1, T2)) :- splite(L, L1, [H|Tail]), tree_build(L1, T1), tree_build(Tail, T2).
tree_build([], empty).

splite(L, L1, L2) :- splite2(L, L, L1, L2).
splite2([H1|L1], [_,_|L2], [H1|T1], R) :- splite2(L1, L2, T1, R).
splite2([H1|L1], [_], T1, [H1|R]) :- splite2(L1, [], T1, R).
splite2(L1, [], [], L1).

% ?- balanced_tree([4,5,6,8,9,5], T).
% T = instant(6, instant(5, instant(4, empty, empty), instant(5, empty, empty)), instant(9, instant(8, empty, empty), empty))
%
%             6
%        5         9
%      4   5     8   -
%     - - - -   - -
%
% ?- balanced_tree([6,3,7,9,4,8,3,1,6,9,4], T), write_tree(T).
% T = instant(6, instant(3, instant(3, instant(1, empty, empty), empty), instant(4, instant(4, empty, empty), empty)), 
%     instant(8, instant(7, instant(6, empty, empty), empty), instant(9, instant(9, empty, empty), empty)))
%
%                  6
%         3                 8
%     3       4         7       9
%   1   -   4   -     6   -   9   -
%  - -     - -       - -     - -
%