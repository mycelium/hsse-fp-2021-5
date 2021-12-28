$ определить предикат mrg(L1, L2, R) который для двух отсортированных списков L1 и L2 
% определяет список R, составленный из этих элементов

mrg([], L2, L2).
mrg(L1, [], L1).

mrg([H1|T1], [H2|T2], [H1|R]) :- H1 < H2, mrg(T1, [H2|T2], TResult).
mrg([H1|T1], [H2|T2], [H2|R]) :- H1 >= H2, mrg([H1|T1], T2, TResult).
