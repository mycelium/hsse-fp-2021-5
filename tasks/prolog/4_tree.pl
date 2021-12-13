% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

pivot(_, [], [], []).
pivot(Pivot, [L|Tail], [L|LTE], GT) :- Pivot >= L, pivot(Pivot, Tail, LTE, GT). 
pivot(Pivot, [L|Tail], LTE, [L|GT]) :- pivot(Pivot, Tail, LTE, GT).

qsort([], []).
qsort([L|Tail], K) :- pivot(L, Tail, L1, L2), qsort(L1, K1), qsort(L2, K2), append(K1, [L|K2], K).

balanced_tree(L, T)  :- qsort(L, K), tree_build(K, T).

tree_build(L, instant(H, T1, T2)) :- splite(L, L1, [H|Tail]), tree_build(L1, T1), tree_build(Tail, T2).
tree_build([], empty).

splite(L, L1, L2) :- splite2(L, L, L1, L2).
splite2([H1|L1], [_,_|L2], [H1|T1], R) :- splite2(L1, L2, T1, R).
splite2([H1|L1], [_], T1, [H1|R]) :- splite2(L1, [], T1, R).
splite2(L1, [], [], L1).

/*
?- balanced_tree([1, 3, 6, 8, 10, 14], T).
T = instant(8, instant(3, instant(1, empty, empty), instant(6, empty, empty)), instant(14, instant(10, empty, empty), empty)) 

        8
      /   \
    3      14
  /   \    /
 1     6  10   

*/
