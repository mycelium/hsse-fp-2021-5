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


my_eq(A,B) :- A=B.
my_xor(A,B) :- A \= B.
my_not(A) :- \+ A.
my_and(A,B) :- A,B.
my_or(A,B) :- A;B.
bool_value(true).
bool_value(fail).

% --- Получение стоки с 'true' или 'fail' в зависимости от значения A
print_bool(S, A) :- A, swritef(S, true).
print_bool(S, A) :- not(A), swritef(S, fail).

% --- Получение комбинации X и Y
permutations(X, Y) :- bagof(A, bool_value(A), A_values),
		bagof(B, bool_value(B), B_values),
		member(X,A_values),
		member(Y,B_values).

truth_table(A, Expression) :- truth_table(A,A,Expression).

% --- Вывод значения из списка в заданном формате
print_values_row(Columns) :- writef("%10l%10l%w\n", Columns).


% --- Вывод таблици истинности заданной операции,
truth_table(A,B, Expression) 
	:- writef("%10l%10l", ["A", "B"]),
	write_term(Expression,[variable_names(['A'=A, 'B'=B])]),
	writef("\n"),
	permutations(A,B),
	print_bool(SA, A), print_bool(SB, B), print_bool(SE, Expression),
	print_values_row([SA,SB,SE]), 
	false.

% --- Пример --- 
% ?- truth_table(A,B,my_and(A,my_xor(A,B))).
% A         B         my_and(A,my_xor(A,B))
% true      true      fail
% true      fail      true
% fail      true      fail
% fail      fail      fail



