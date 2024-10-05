parent(tin, htay).
parent(tin, moe).
parent(hla, kyi).
parent(hla, htwe).
parent(htay, wine).
parent(htay, bhone).
parent(moe, pyae).
parent(wine, nyan).
parent(kyi,bhone).
parent(kyi,wine).

female(moe).
female(kyi).
female(wine).
female(pyae).

male(tin).
male(hla).
male(htay).
male(bhone).
male(nyan).

mother(X,Y) :- parent(X,Y), female(X).
father(X,Y) :- parent(X,Y), male(X).
sister(X,Y) :- parent(Z,X), parent(Z,Y), female(X), not(X=Y).
grandson(X,Y) :- parent(Z,X), parent(Y,Z), male(X).
siblings(X,Y) :- parent(Z,X), parent(Z,Y), not(X=Y).

firstCousin(X,Y) :- parent(I, X), parent( J, Y), siblings(I,J).
descendant(X,Y) :- parent(Y,X).
