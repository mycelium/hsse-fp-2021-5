% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный 

qsort([T|A],Y):-
  partition(A,T,L,C),
  qsort(L,Kl),
  qsort(C,Kc),
  append(Kl,[T|Kc],Y).
  qsort([],[]).

partition([T|A],X,[T|L],C):-
                          T =< X,
                          partition(A,X,L,C).
  
partition([T|A],X,[T|L],C):-
                          T > X,
                          partition(A,X,L,C).
                        partition([],X,[],[]).
