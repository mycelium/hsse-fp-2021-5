% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

:- consult(‘3_quicksort.pl’)

balanced_tree(L,T):-
  qsort(L,K),
  build_tree(K,T).
  
  build_tree([],empty).
  build_tree(L,instant(A,B,C)):-
                            div(L,X,[A|Y]),
                            build_tree(X,B),
                            build_tree(Y,C).
                            
      
      
      div(L,X,Y):-
            length(L,S),
            H is S-S//2,
            length(Y,H),
            append(X,Y,L).
            
