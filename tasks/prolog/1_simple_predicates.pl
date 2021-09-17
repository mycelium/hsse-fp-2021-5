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

	%1
	brother(X, Y) :- father(Z, X), father(Z, Y), Y \= X.
	%2
	cousin(X, Y) :- father(Z, X), father(W, Y), brother(Z, W).
	%3
	grandson(X, Y) :- father(W, X), father(Y, W).
	%4
	descendent(X, Y) :- (father(Y, X); grandson(X, Y)).
% указать в каком порядке и какие ответы генерируются вашими методами
	% ?- brother(X,Y).
	% ?- cousin(X,Y).
	% ?- grandson(X,Y).
	% ?- descendent(X,Y).
	query() :- write("brothers"), nl, brother(X, Y), write(X), write(" "), write(Y), nl, fail;
		write("cousins"), nl, cousin(X, Y), write(X), write(" "), write(Y), nl, fail;
		write("grandsons"), nl, grandson(X, Y), write(X), write(" "), write(Y), nl, fail;
		write("descendants"), nl, descendent(X, Y), write(X), write(" "), write(Y), nl, fail.
/*
	?- query().
	brothers
	b c
	c b
	d e
	e d
	cousins
	d f
	e f
	f d
	f e
	grandsons
	d a
	e a
	f a
	descendants
	b a
	c a
	d b
	e b
	f c
	d a
	e a
	f a
	false.
*/
