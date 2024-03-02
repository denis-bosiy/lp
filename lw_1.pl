% Факты
male(bill).
male(paul).
male(joe).
male(jim).
male(bob).
female(sue).
female(mary).
female(tammy).
female(ann).

parent(bill, joe).
parent(bill, ann).
parent(sue, joe).
parent(sue, ann).
parent(paul, jim).
parent(mary, jim).
parent(joe, tammy).
parent(ann, bob).
parent(jim, bob).

% Правила
different(X, Y) :- X \= Y.
sister(X, Y) :- different(X, Y), parent(Z, X), parent(Z, Y), female(X).
aunt(X, Y) :- different(X, Y), parent(Z, Y), sister(X, Z).
cousin(X, Y) :- different(X, Y), parent(Z, A), parent(A, X), parent(Z, B), parent(B, Y).


% Факты
likes(ellen, reading).
likes(john, computers).
likes(john, badminton).
likes(john, photos).
likes(john, reading).
likes(leonard, badminton).
likes(eric, swimming).
likes(eric, reading).
likes(eric, chess).
likes(paul, swimming).