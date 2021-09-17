% определить предикаты:
	% and(A,B)
	and(A, B) :- A, B.
	% or(A, B)
	or(A, B) :- (A; B).
	% xor(A, B)
	xor(A, B) :- or(and(not(A), B), and(A, not(B))).
	% not(A)
	% ______уже системно определен
	% equ(A,B)
	equ(A, B) :- A == B. 
% ипользовать предикат truth_table(A,B, expression) для построения таблиц истинности, например:
% truth_table(A,B,and(A,or(A,B))).
% true true true
% true fail true
% fail true fail
% fail fail fail

% все возможные комбинации
bool(true). 
bool(fail).
 
truth_table(A,B,Expr) :- bool(A), bool(B), do(A,B,Expr), fail. % подставляем все возможные комбинации
do(A,B,Expr) :- write(A), write(' '), write(B), write(' '), fail. % выводим комбинацию
do(_,_,Expr) :- Expr, !, write(true), nl. % если текущая комбинация дает истину, 
										  % то прекращаем перебор вариантов(отсекаем следующий) и выводим true
do(_,_,_) :- write(fail), nl. % если не найдено истиное значение, то выводим fail

/*
?- truth_table(X,Y,xor(X,and(Y,X)))..
true true fail
true fail true
fail true fail
fail fail fail

?- truth_table(X,Y,not(and(or(X,Y),and(Y,X)))).
true true fail
true fail true
fail true true
fail fail true

?- truth_table(X,Y,not(and(or(X,Y),xor(Y,X)))).
true true true
true fail fail
fail true fail
fail fail true
*/