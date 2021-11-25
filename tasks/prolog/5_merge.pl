% определить предикат mrg(L1, L2, R) который для двух отсортированных списков L1 и L2 
% определяет список R, составленный из этих элементов

mrg([], [], []).
mrg([], L, L).
mrg(L, [], L).

mrg([LeftL|LeftR],[RightL|RughtR],[LeftL|T]):- LeftL=<RightL, mrg(LeftR,[RightL|RughtR],T).
mrg([LeftL|LeftR],[RightL|RughtR],[RightL|T]):- LeftL>RightL, mrg([LeftL|LeftR],RughtR,T).

%mrg([1,4,34,42],[0,0,6,15,37], R).
%R = [0, 0, 1, 4, 6, 15, 34, 37, 42] ;
%false.