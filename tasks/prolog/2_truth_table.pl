% определить предикаты:
    % and(A,B)
    % or(A, B)
    % xor(A, B)
    % not(A)
    % equ(A,B)

    and(A,B) :- A,B.
    or(A,B) :- (A;B), !.
    xor(A,B) :- A \= B.
    not(A) :- \+A.
    equ(A,B) :- A = B.

% ипользовать предикат truth_table(A,B, expression) для построения таблиц истинности, например:
% truth_table(A,B,and(A,or(A,B))).
% true true true
% true fail true
% fail true fail
% fail fail fail

boolean(true).
boolean(fail).

truth_table(A,B, Expression) :- 
    boolean(A), boolean(B), write_table_line(A,B, Expression), fail.

write_table_line(A, B, Expr) :-
    Expr,
    write(A), write(" "), write(B), write(" "), write(true), nl, !.
write_table_line(A, B, _) :-
    write(A), write(" "), write(B), write(" "), write(fail), nl, !.

% Привести выводы таблиц истинности для разных выражений
%?- truth_table(A,B,and(A,or(A,B))).
%true true true
%true fail true
%fail true fail
%fail fail fail
%false.

%?- truth_table(A,B,or(not(A),B)).
%true true true
%true fail fail
%fail true true
%fail fail true
%false.

%?- truth_table(A,B,and(or(not(A),B),B)).
%true true true
%true fail fail
%fail true true
%fail fail fail
%false.

%?- truth_table(A,B,xor(A,B)).
%true true fail
%true fail true
%fail true true
%fail fail fail
%false.
