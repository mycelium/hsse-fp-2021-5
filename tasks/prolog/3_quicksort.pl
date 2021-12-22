% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный

qsort([Head|Tail],Ys) :- partition(Tail,Head,Left,Right),
                        qsort(Left,Ls),
                        qsort(Right,Rs),
                        append(Ls,[Head|Rs],Ys).
qsort([],[]).

partition([Head|Tail],Y,[Head|Ls],Rs) :- Head =< Y, partition(Tail,Y,Ls,Rs).
partition([Head|Tail],Y,Ls,[Head|Rs]) :- Head > Y, partition(Tail,Y,Ls,Rs).
partition([],Y,[],[]).

append([],Ys,Ys).
append([Head|Tail],Ys,[Head|Zs]) :- append(Tail,Ys,Zs).
