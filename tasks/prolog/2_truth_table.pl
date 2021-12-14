and(A, B) :-
    A,
    B.

or(A, B) :-
    A;
    B.

equ(A, B) :-
    A = B.

not(A) :-
    \+ A.

xor(A, B) :-
    A \= B.

bool(true).
bool(fail).

truth_table(A, B, Expr) :-
    bool(A),
    bool(B),
    write(A),
    write(' '),
    write(B),
    write(' '),
	(Expr -> write(true); write(fail)),
    nl.




 %   ?- truth_table(A, B, xor(not(A), B))
 %   true true true
 %   true fail true
 %   fail true true
 %   fail fail true


% ипользовать предикат truth_table(A,B, expression) для построения таблиц истинности, например:
% truth_table(A,B,and(A,or(A,B))).
% true true true
% true fail true
% fail true fail
% fail fail fail