% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)
:- ['3_quicksort.pl'].

balanced_tree(L,T) :- qsort(L,S), build_tree(S,T).

build_tree([], empty).
build_tree(S, instant(K, L, R)) :- split_in_half(S, Left, [K|Right]), build_tree(Left, L), build_tree(Right, R).

%Разбиение пополам для нечетного числа элементов
split_in_half(L, LeftHalf, RightHalf) :- append(LeftHalf, RightHalf, L), length(LeftHalf, N), length(RightHalf, N1), N1 is N+1.
%Разбиение пополам для четного числа элементов
split_in_half(L, LeftHalf, RightHalf) :- append(LeftHalf, RightHalf, L), length(LeftHalf, N), length(RightHalf, N).
/*
?- balanced_tree([13,10,14,6,4,7,1,3,8],X).
X = instant(7, instant(4, instant(3, instant(1, empty, empty), empty), instant(6, empty, empty)), instant(13, instant(10, instant(8, empty, empty), empty), instant(14, empty, empty)))

?- balanced_tree([1,2,3,4,5],X).
X = instant(3, instant(2, instant(1, empty, empty), empty), instant(5, instant(4, empty, empty), empty)) 

?- balanced_tree([7,3,5,-4,64],X).
X = instant(5, instant(3, instant(-4, empty, empty), empty), instant(64, instant(7, empty, empty), empty)) 
*/