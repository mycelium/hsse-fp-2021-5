% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

:- ['3_quicksort.pl'].

len([],0).
len([H|T],LEN):- len(T,N), LEN is N+1.

% Подбираем такой LT, чтобы его длина была равна половине исходного K.
% RT подбираем так, чтобы если к выбранному LT приставить RT получился исходный K.  

divide_tree(K,LT,RT):- len(K,LEN), X is LEN//2, len(LT,X), append(LT,RT,K).

tree([],empty).
tree(K,instant(ROOT,L,R)):- divide_tree(K,LT,[ROOT|RT]), tree(LT,L), tree(RT,R).

% Пустое бинарное дерево всегда сбалансированное.
balanced_tree([],T).
balanced_tree(L,T):- qsort(L,K), tree(K,T).

% ?- balanced_tree([4,1,9,5,8],T).
% T = instant(5, instant(4, instant(1, empty, empty), empty), instant(9, instant(8, empty, empty), empty)) .
%               ┌ -
%          ┌ 1 ─┤
%    ┌─ 4 ─┤    └ -
%    │     └ -
% 5 ─┤          ┌ -
%    │     ┌ 8 ─┤
%    └─ 9 ─┤    └ -
%          └ -
   
% ?- balanced_tree([90,12,0,1,1,25,89,90],T).
% T = instant(25, instant(1, instant(1, instant(0, empty, empty), empty), instant(12, empty, empty)), instant(90, instant(89, empty, empty), instant(90, empty, empty))) .
%                       ┌ -
%                  ┌ 0 ─┤
%            ┌  1 ─┤    └ -
%            │     └ - 
%     ┌─  1 ─┤
%     │      │     ┌ -   
%     │      └ 12 ─┤
%     │            └ - 
% 25 ─┤          
%     │            ┌ -
%     │      ┌ 89 ─┤
%     │      │     └ -
%     └─ 90 ─┤
%            │     ┌ -
%            └ 90 ─┤
%                  └ -