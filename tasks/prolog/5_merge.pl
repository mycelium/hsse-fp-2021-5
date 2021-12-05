$ определить предикат mrg(L1, L2, R) который для двух отсортированных списков L1 и L2 
% определяет список R, составленный из этих элементов


mrg(A, [], A).
mrg([], B, B).
mrg([A|TailA], [B|TailB], [A|TailMerged]) :- A =< B, mrg(TailA, [B|TailB], TailMerged).	
mrg([A|TailA], [B|TailB], [B|TailMerged]) :- A > B, mrg([A|TailA], TailB, TailMerged).