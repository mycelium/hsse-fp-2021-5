% определить предикат mrg(L1, L2, R) который для двух отсортированных списков L1 и L2 
% определяет список R, составленный из этих элементов

%handle empty list cases
mrg([], R, R).
mrg(L, [], L).

%consider L1 L2 as head-tail
%L1 = [1, 2, 4], L2 = [3, 6, 9]
% [H1 | T1] = [1 | [2, 4]]
% [H2 | T2] = [3 | [6, 9]]
%
% 1 < 3 -> cut L1 -> recurse -> 2 < 3 -> cut L1 -> recurce -> 4 >= 3 -> cut L2 -> recurse -> 4 < 6 -> cut L1 (empty) -> recurse to line 5.
% backtrace build-up [6, 9] -> [4, 6, 9] -> [3, 4, 6, 9] -> [2, 3, 4, 6, 9] -> [1, 2, 3, 4, 6, 9]. END
mrg([H1|T1],[H2|T2],[H1|R]):- H1<H2, mrg(T1,[H2|T2],R).
mrg([H1|T1],[H2|T2],[H2|R]):- H1>=H2, mrg([H1|T1],T2,R).
