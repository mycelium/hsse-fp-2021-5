% определить предикаты:
	% and(A,B)
	% or(A, B)
	% xor(A, B)
	% not(A)
	% equ(A,B)
% ипользовать предикат truth_table(A,B, expression) для построения таблиц истинности, например:
% truth_table(A,B,and(A,or(A,B))).
% true true true
% true fail true
% fail true fail
% fail fail fail

and(A,B):-A,B.
or(A,B):-not(and(not(A),not(B)).
xor(A,B):-or(and(not(A),B),and(A,not(B)).
not(A):-\+A.
equ(A,B):- not(xor(A,B).

evaluate(E, true) :- E, !. 
evaluate(_, false). 

bool(true). 
bool(false). 

truth_table(A,B,E) :- 
		    bool(A), 
		    bool(B), 
		    write(A), 
		    write(' \t '), 
		    write(B), 
		    write(' \t '), 
		    evaluate(E, Result), 
			write(Result),
			nl, 
			fail. 

?-Truth_table(A,B,and(A,B)).
true     true    true
true     false   false
false    true    false
false    false   false
false.
