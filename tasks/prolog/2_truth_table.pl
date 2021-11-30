and(A,B):-A,B.
or(A,B):-not(and(not(A),not(B)).
xor(A,B):-or(and(not(A),B),and(A,not(B)).
not(A):-\+A.
equ(A,B):- not(xor(A,B) .

evaluate(E, true) :- E, !. 
evaluate(_, false). 

bool(true). 
bool(false). 

truth_table(A,B,E) :- 
		    bool(A), 
		    bool(B), 
		    write(A), 
		    write(' /t '), 
		    write(A), 
		    write(' /t '), 
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