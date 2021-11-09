mrg([L1|L1_tail], [L2|L2_tail], [L1|Res]):-
    L1 =< L2,
    mrg(L1_tail, [L2|L2_tail], Res).

mrg(L1, [], L1).

mrg([L1|L1_tail], [L2|L2_tail], [L2|Res]):-
    L1 > L2,
    mrg([L1|L1_tail], L2_tail, Res).

mrg([], L2, L2).

mrg([], [], []).






%?- mrg([1,3],[2,4],[1,2,3,4])
%true