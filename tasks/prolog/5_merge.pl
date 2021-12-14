% определить предикат mrg(L1, L2, R) который для двух отсортированных списков L1 и L2 
% определяет список R, составленный из этих элементов

mrg(A, [], A).
mrg([], B, B).
mrg([A|TA], [B|TB], [A|TailMerged]) :- A =< B, mrg(TA, [B|TB], TailMerged).
mrg([A|TA], [B|TB], [B|TailMerged]) :- A > B, mrg([A|TA], TB, TailMerged).