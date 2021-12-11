% есть набор фактов вида father(person1, person2) (person1 is the father of person2)
% Необходимо определить набор предикатов:
% 1. brother(X,Y)    -  определяющий являются ли аргументы братьями
% 2. cousin(X,Y)     -  определяющий являются ли аргументы двоюродными братьями
% 3. grandson(X,Y)   -  определяющий является ли аргумент Х внуком аргумента Y
% 4. descendent(X,Y) -  определяющий является ли аргумент X потомком аргумента Y
% 5. используя в качестве исходных данных следующий граф отношений
	father(a,b).  % 1                 
	father(a,c).  % 2
	father(b,d).  % 3
	father(b,e).  % 4
	father(c,f).  % 5
% указать в каком порядке и какие ответы генерируются вашими методами
	?- brother(X,Y).
	?- cousin(X,Y).
	?- grandson(X,Y).
	?- descendent(X,Y).
ather(a,b). % 1
father(a,c). % 2
father(b,d). % 3
father(b,e). % 4
father(c,f). % 5


brother(X,Y) :- father(Z,X), father(Z,Y), X \= Y.

cousin(X,Y) :- father(W,X), father(Z,Y), brother(W,Z).

grandson(X,Y) :- father(Y,Z), father(Z,X).

descendent(X,Y) :- father(Y,X).

descendent(X,Y) :- father(Y,Z), descendent(X,Z).
/* brother(X,Y).
X Y
b c 1
c b 2
d e 3
e d 4
cousin(X,Y).
X Y
d f 1
e f 2
f d 3
f e 4
grandson(X,Y).
X Y
d a 1
e a 2
f a 3
descendent(X,Y)
X Y
b a 1
c a 2
d b 3
e b 4
f c 5
d a 6
e a 7
f a 8
*/
