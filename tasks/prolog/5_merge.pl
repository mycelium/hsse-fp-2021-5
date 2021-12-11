$ определить предикат mrg(L1, L2, R) который для двух отсортированных списков L1 и L2 
% определяет список R, составленный из этих элементов
mrg([], L2, L2).
mrg(L1, [], L1).

mrg([H1|TH1], [H2|TH2], [H1|TMerged]) :- H1 < H2, mrg(TH1, [H2|TH2], TMerged).
mrg([H1|TH1], [H2|TH2], [H2|TMerged]) :- H1 >= H2, mrg([H1|TH1], TH2, TMerged).
