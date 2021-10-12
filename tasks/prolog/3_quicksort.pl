% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный 
% L - in array, K - out array

qsort([X|Xs],Ys) :-
  partition(Xs,X,Left,Right),
  qsort(Left,Ls),
  qsort(Right,Rs),
  append(Ls,[X|Rs],Ys), !.
qsort([],[]).

partition([X|Xs],Y,[X|Ls],Rs) :-
  X =< Y, partition(Xs,Y,Ls,Rs).
partition([X|Xs],Y,Ls,[X|Rs]) :-
  X > Y, partition(Xs,Y,Ls,Rs).
partition([],_,[],[]).

append([],Ys,Ys).
append([X|Xs],Ys,[X|Zs]) :- append(Xs,Ys,Zs).