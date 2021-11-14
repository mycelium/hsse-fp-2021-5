% определить предикат mrg(L1, L2, R) который для двух отсортированных списков L1 и L2 
% определяет список R, составленный из этих элементов

mrg([X|List1], [Y|List2], [X|Result]) :- X < Y, mrg(List1, [Y|List2], Result).
mrg([X|List1], [Y|List2], [Y|Result]) :- X >= Y, mrg([X|List1], List2, Result).
mrg([], List2, List2).
mrg(List1, [], List2).
mrg([], [], []).

% ?- mrg([1, 2, 5, 6, 7], [3, 4, 5, 8], Result).
% Result = [1, 2, 3, 4, 5, 5, 6, 7, 8] 