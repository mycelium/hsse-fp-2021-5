mrg([],[],_).
mrg([],R,R).
mrg(L,[],L).
mrg([LL|LR],[RL|RR],[LL|T]) :- LL =< RL,
                             mrg(LR,[RL|RR],T).
mrg([LL|LR],[RL|RR],[RL|T]) :- RL < LL,
                             mrg([LL|LR],RR,T).