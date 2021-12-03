% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный

divide(P,[],[],[]).

%X - значения, меньшие выбранного P
%Y - значения, большие выбранного P

divide(P,[H|T],[H|X],Y):- H<P, divide(P,T,X,Y).
divide(P,[H|T],X,[H|Y]):- H>P, divide(P,T,X,Y). 

qsort([],[]).

%В качестве опорного элемента P используется голова списка 

qsort([P|T], K):- divide(P,T,X,Y), qsort(X,X_SORTED), qsort(Y,Y_SORTED), append(X_SORTED,[P|Y_SORTED], K).  