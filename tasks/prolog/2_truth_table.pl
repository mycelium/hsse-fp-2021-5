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

bool(true).
bool(false).

not(A) :- \+ A.
and(A, B) :- A, B.
or(A, B) :- not(and(not(A),	not(B))).
xor(A, B) :- or(and(A, not(B)), and(not(A), B)).
equ(A, B) :- not(xor(A, B)).

eval(Expression, true) :- Expression, !.
eval(Expression, false) :- not(Expression), !.

truth_table(A, B, Expression) :- bool(A), 
                                 bool(B),
                                 eval(Expression, Res),
                                 write(A), 
                                 write('\t'), 
                                 write(B), 
                                 write('\t'),
                                 write(Res),
                                 nl, fail.

/*
swipl .\2_truth_table.pl
?- truth_table(A, B, not(xor(A, B))).
true    true    true
true    false   false
false   true    false
false   false   true
false.
?- truth_table(A, B, xor(or(A, B), and(A, B))).
true    true    false
true    false   true
false   true    true
false   false   false
false.
*/
