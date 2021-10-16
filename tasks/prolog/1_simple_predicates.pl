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
	
brother(X,Y) :- father(A,X), father(A,Y), X \= Y.
cousin(X,Y) :- father(B,X), father(A,Y), brother(B,A).
grandson(X,Y) :- father(Y,A), father(A,X).
descendent(X,Y) :- father(Y,X).
descendent(X,Y) :- father(Y,A), descendent(X,A)

% указать в каком порядке и какие ответы генерируются вашими методами
	?- brother(X,Y).
	?- cousin(X,Y).
	?- grandson(X,Y).
	?- descendent(X,Y).

% L = [[b, c], [c, b], [d, e], [e, d]].                  % 1
% L = [[d, f], [e, f], [f, d], [f, e]].                  % 2
% L = [[d, a], [e, a], [f, a]].                          % 3
% L = [[b,a],[c,a],[d,b],[e,b],[f,c],[d,a],[e,a],[f,a]]. % 4
