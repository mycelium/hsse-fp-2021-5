% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

qsort([], []).

qsort([H|Tail], Res) :-  % H -- опорный элемент, всегда берётся первый в списке
  split(H, Tail, Tail_1, Tail_2),  % остаток списка делится на два подсписка
  qsort(Tail_1, Sorted_1),  % кадждый из подсписков сортируется
  qsort(Tail_2, Sorted_2),
  append(Sorted_1, [H], Res_1),  % все они собираются в один список
  append(Res_1, Sorted_2, Res).  % с опорным элементом посередине

split(_, [], [], []).  % разделение единственной переменной не имеет смысла (пустые подсписки)

split(X, [H|Tail], [H|Tail_1], Tail_2) :-  % все элементы, меньшие X переставляются в Tail_1
  H < X,
  split(X, Tail, Tail_1, Tail_2).

split(X, [H|Tail], Tail_1, [H|Tail_2]) :-  %
  H >= X,
  split(X, Tail, Tail_1, Tail_2).

% Деревья

build_tree([], empty).

build_tree(List, Tree) :-
  Tree = instant(Root, Left_Tree, Right_Tree),
  length(List, List_Len),
  Half_Len is List_Len // 2,
  length(Left_List, Half_Len),
  append(Left_List, [Root|Right_List], List),
  build_tree(Left_List, Left_Tree),
  build_tree(Right_List, Right_Tree).

% Ради чего всё затевалось..
balanced_tree(L, T) :-
  qsort(L, Sorted),
  build_tree(Sorted, T).

%  Пример
%
% ?- balanced_tree([1, 2, 3, 4, 5, 6, 7], Y).
% Y = instant(4, instant(2, instant(1, empty, empty), instant(3, empty, empty)), instant(6, instant(5, empty, empty), instant(7, empty, empty))) ;
