% определить предикат mrg(L1, L2, R) который для двух отсортированных списков L1 и L2 
% определяет список R, составленный из этих элементов

mrg(L1, [], L1).
mrg([], L2, L2).
mrg([H11,H12|L1], [H21,H22|L2], R) :- 
	H11 < H12, H21 < H22,
	mrg_asc([H11,H12|L1], [H21,H22|L2], R).
mrg([H11,H12|L1], [H21,H22|L2], R) :- 
	H11 >= H12, H21 >= H22,
	mrg_desc([H11,H12|L1], [H21,H22|L2], R).

mrg_asc(L1, [], L1).
mrg_asc([], L2, L2).
mrg_asc([H1|L1], [H2|L2], [H1|R]) :- H1 < H2, mrg_asc(L1, [H2|L2], R).
mrg_asc([H1|L1], [H2|L2], [H2|R]) :- mrg_asc([H1|L1], L2, R).

mrg_desc(L1, [], L1).
mrg_desc([], L2, L2).
mrg_desc([H1|L1], [H2|L2], [H1|R]) :- H1 > H2, mrg_desc(L1, [H2|L2], R).
mrg_desc([H1|L1], [H2|L2], [H2|R]) :- mrg_desc([H1|L1], L2, R).


% both ascending
% ?- mrg([1,2,3],[0,6,9],R).
% R = [0, 1, 2, 3, 6, 9] .

% both descending
% ?- mrg([3,2,1],[6,4,3],R).
% R = [6, 4, 3, 3, 2, 1] .

% different directions
% ?- mrg([1,2,3],[6,4,3],R).
% false.

% for unsorted lists matching one of mrg(L1, L2, R) cases,
% result is an unsorted list
