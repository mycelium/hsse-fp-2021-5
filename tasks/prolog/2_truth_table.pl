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

and(X, Y) :- X, Y.
or(X, Y) :- X; Y.
xor(X, Y) :- not(X), Y; X, not(Y).
equ(X, Y) :- X = Y.

operand(true).
operand(false).

truth_table(X, Y, Expression) :- operand(X), operand(Y),
                                 write(X), write("\t"), write(Y), write("\t"),
                                 % ( condition -> then_clause ; else_clause )
                                 (Expression -> write("true"); write("false")),
                                 write("\n"),
                                 false.

/*
    ?- truth_table(X, Y, and(X, Y)).
    true    true    true
    true    false   false
    false   true    false
    false   false   false
    false.

    ?- truth_table(X, Y, or(X, Y)).
    true    true    true
    true    false   true
    false   true    true
    false   false   false
    false.

    ?- truth_table(X, Y, xor(X, Y)).
    true    true    false
    true    false   true
    false   true    true
    false   false   false
    false.

    ?- truth_table(X, Y, equ(X, Y)).
    true    true    true
    true    false   false
    false   true    false
    false   false   true
    false.
*/

