	father(a,b).  % 1                 
	father(a,c).  % 2
	father(b,d).  % 3
	father(b,e).  % 4
	father(c,f).  % 5


brother(X, Y) :-
    father(F, X),
    father(F, Y),
    X \= Y.

cousin(X, Y) :-
    father(FX, X),
    father(FY, Y),
    brother(FX, FY),
    X \= Y.

grandson(X, Y) :-
    father(X, Z),
    father(Z, Y).

descendent(X, Y) :- father(X, Y).
descendent(X, Y) :-
    father(X, Z),
    descendent(Z, Y).


%	?- brother(X,Y).
%	X = b,
%   Y = c
%   X = c,
%    Y = b
%    X = d,
%    Y = e
%    X = e,
%    Y = d

%	?- cousin(X,Y).
%	X = d,
%    Y = f
%    X = e,
%    Y = f
%    X = f,
%    Y = d
%    X = f,
%    Y = e

%	?- grandson(X,Y).
%	X = a,
%    Y = d
%    X = a,
%    Y = e
%    X = a,
%    Y = f

%	?- descendent(X,Y).
%	X = a,
%    Y = b
%   X = a,
%    Y = c
%    X = b,
%    Y = d
%    X = b,
%    Y = e
%    X = c,
%    Y = f
%    X = a,
%    Y = d
%    X = a,
%    Y = e
%    X = a,
%    Y = f