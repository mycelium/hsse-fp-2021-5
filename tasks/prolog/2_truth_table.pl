cnot(true, fail).
cnot(fail,true).
cand(fail,fail,fail).
cand(fail,true,fail).
cand(true,fail,fail).
cand(true,true,true).
cor(fail,fail,fail).
cor(fail,true,true).
cor(true,fail,true).
cor(true,true,true).
cxor(X, Y, Z) :- cnot(X, N1), cnot(Y, N2),cand(X, N2, N3), cand(Y, N1, N4), cand(X, N2, N3), cand(Y, N1, N4), cor(N3, N4, Z).
?-cxor(I1,I2,S),write(I1), write(" "), write(I2), write(" "), write(S), write(" "), nl, fail.
