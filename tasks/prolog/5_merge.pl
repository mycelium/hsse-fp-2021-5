$ определить предикат mrg(L1, L2, R) который для двух отсортированных списков L1 и L2 
% определяет список R, составленный из этих элементов

mrg(A, [], A).
mrg([], B, B).

mrg([A|T_A], [B|T_B], [A|T_Merged]) :-
	A =< B,
	mrg(T_A, [B|T_B], T_Merged).
	
mrg([A|T_A], [B|T_B], [B|T_Merged]) :-
	A > B,
	mrg([A|T_A], T_B, T_Merged).
