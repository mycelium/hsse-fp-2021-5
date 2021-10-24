% определить предикат mrg(L1, L2, R) который для двух отсортированных списков L1 и L2 
% определяет список R, составленный из этих элементов
	
mrg([], [], []).
mrg([], L2, L2).
mrg(L1, [], L1).
mrg([H1|Tail1], [H2|Tail2], [H1|TailResult]) :-
   H1 < H2, mrg(Tail1, [H2|Tail2], TailResult).
  
mrg(L1, [H2|Tail2], [H2|TailResult]) :-
   mrg(L1, Tail2, TailResult).
