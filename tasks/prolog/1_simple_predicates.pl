% есть набор фактов вида father(person1, person2) (person1 is the father of person2)
% набор предикатов:
  brother(X,Y) :-
    father(Z,X),
    father(Z,Y).

  cousin(X,Y) :-
    brother(A,Z),
    father(A,X),
    father(Z,Y).

  grandson(X,Y) :-
    father(Y,Z),
    father(Z,X).

  descendent(X,Y) :-
    father(Z,X), descendent(Z,Y);
    father(Y,X).

% используя в качестве исходных данных следующий граф отношений
	father(a,b).  % 1                 
	father(a,c).  % 2
	father(b,d).  % 3
	father(b,e).  % 4
	father(c,f).  % 5

% указать в каком порядке и какие ответы генерируются вашими методами
	?- brother(X,Y).
% X = b, Y = c
% X = c, Y = b
% X = d, Y = e
% X = e, Y = d

	?- cousin(X,Y).
% X = d, Y = e
% X = e, Y = d
% X = d, Y = f
% X = e, Y = f
% X = f, Y = d
% X = f, Y = e

	?- grandson(X,Y).
% X = d, Y = a
% X = e, Y = a
% X = f, Y = a

	?- descendent(X,Y).
% X = d, Y = a
% X = e, Y = a
% X = f, Y = a
% X = b, Y = a
% X = c, Y = a
% X = d, Y = b
% X = e, Y = b
% X = f, Y = c
