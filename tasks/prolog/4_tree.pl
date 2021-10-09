% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)
balanced_tree([], empty).
balanced_tree(L,T) :- qsort(L,R), put(R,empty,RES),  balance(RES, T).

put(EMP,X,RES):- EMP==empty; EMP==[], balance(X, RES),!.
put([NODE|LIST], instant(ME, L, R), RES) :- put(NODE, R, R1), put(LIST, instant(ME, L, R1), R2), balance(R2, RES),!.
put([NODE|LIST], empty, RES):- put(LIST, instant(NODE, empty, empty), R), balance(R, RES),!.
put(NODE, empty, RES) :- balance(instant(NODE, empty, empty), RES),!.
put(NODE, instant(ME, L, R), instant(ME, L, RES)) :- put(NODE, R, R1), balance(R1, RES),!.

balance(instant(ME, L, instant(R, RL, RR)), RES):- factor(L, instant(R, RL, RR), F1),-1>F1,
    factor(RL, RR, F2), F2>0,
    rotateRight(instant(R, RL, RR), NEWR),
    rotateLeft(instant(ME, L, NEWR), RES),!.
balance(instant(ME, L, R), RES):- factor(L, R, F1), -1>F1,
    rotateLeft(instant(ME, L, R), RES),!.
balance(instant(ME, instant(L, LL, LR), R), RES):- factor(instant(L, LL, LR), R, F1), 1<F1,
    factor(LL, LR, F2), F2<0,
    rotateLeft(instant(L, LL, LR), NEWL),
    rotateRight(instant(ME, NEWL, R), RES),!.
balance(instant(ME, L, R), RES):- factor(L, R, F1),  1<F1,
    rotateRight(instant(ME, L, R), RES),!.
balance(instant(ME, L, R), instant(ME, L1, R1)):- balance(L,L1), balance(R,R1).
balance(empty, empty).

rotateLeft(instant(ME, L, instant(R, RL, RR)), instant(R, instant(ME, L, RL), RR)).
rotateRight(instant(ME,  instant(L, LL, LR), R), instant(L, LL, instant(ME, LR, R))).

factor(L, R, RES) :- height(L, H1), height(R, H2), RES is H1-H2.

height(empty, 0).
height(instant(_, L, R), RES):- height(L, H1), height(R, H2), max(H1, H2, H), RES is H+1,!.

max(X,Y,X) :- X>=Y,!.
max(X,Y,Y) :- X<Y.