% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный 


qsort([],[]).   

% Left - элементы из Tail меньше X, Right - больше => рекурсия => 
% результирующий список: отсортированная левая часть, X, отсортированная правая

qsort([X|Tail], SortedResult) :-         
	split_(X, Tail, Left, Right), qsort(Left, SortedLeft),
	qsort(Right, SortedRight), append(SortedLeft, [X|SortedRight], SortedResult).
	
split_(X, [],[],[]).
split_(X, [Y|Tail], [Y|Left], Right) :- X > Y, split_(X, Tail, Left, Right).
split_(X, [Y|Tail], Left, [Y|Right]) :- split_(X, Tail, Left, Right).