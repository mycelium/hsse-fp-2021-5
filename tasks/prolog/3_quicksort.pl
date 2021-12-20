% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный 
qsort([X|Z],Y):-
  partition(Z,X,L,B),
  qsort(L,Kl),
  qsort(B,Kb),
  append(Kl,[X|Kb],Y).
  qsort([],[]).

partition([X|Z],P,[X|L],B):-
                          X =< P,
                          partition(Z,P,L,B).
  
partition([X|Z],P,[X|L],B):-
                          X > P,
                          partition(Z,P,L,B).
                        partition([],P,[],[]).
