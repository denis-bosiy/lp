seg(1, point(1, 11), point(14, 11)).
seg(2, point(2, 4), point(13, 4)).
seg(3, point(2, 2), point(9, 2)).
seg(4, point(3, 10), point(3, 1)).
seg(5, point(7, 10), point(13, 10)).
seg(6, point(8, 13), point(8, 0)).
seg(7, point(10, 12), point(10, 3)).
seg(8, point(11, 13), point(11, 3)).
seg(9, point(12, 12), point(12, 2)).

horiz(N) :- seg(N, point(_, Y), point(_, Y)).
vertical(N) :- seg(N, point(X, _), point(X, _)).

cross(N, M, point(X, Y), NL, ML) :- seg(N, point(X0, Y0), point(X1, Y1)),
  seg(M, point(X2, Y2), point(X3, Y3)),
  ((X0 = X1, Y2 = Y3, X0 >= X2, X0 =< X3, Y2 =< Y0, Y2 >= Y1,
   X is X0, Y is Y2, NL is Y0 - Y1, ML is X3 - X2
  ); (Y0 = Y1, X2 = X3, Y0 =< Y2, Y0 >= Y3, X2 >= X0, X2 =< X1,
   X is X2, Y is Y0, NL is X1 - X0, ML is Y2 - Y3
  )).

perimetr(A,B,C,D,P,S) :- cross(A, B, point(X0, Y0), _, _),
  cross(B, C, point(X1,_), _, _), cross(C, D, point(_,_), _, _),
  cross(D, A, point(_,Y3), _, _), X1 > X0, Y0 > Y3,
  P is ((X1-X0) + (Y0-Y3))*2, S is (X1-X0) * (Y0-Y3).
  
  