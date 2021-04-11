/*Specifies all areas within the tower*/

/*Floor 1*/
area(tower, t1f1).
area(tower, t1f2).
area(tower, t1f3).
area(tower, t1f4).
area(tower, t1f5).
area(tower, t1f6).
area(tower, t1f7).
area(tower, t1f8).
area(tower, t1f9).
area(tower, t1f10).
area(tower, t1f11).


/*Floor 2*/
area(tower, t2f1).
area(tower, t2f2).
area(tower, t2f3).
area(tower, t2f4).
area(tower, t2f5).
area(tower, t2f6).
area(tower, t2f7).
area(tower, t2f8).
area(tower, t2f9).
area(tower, t2f10).
area(tower, t2f11).
area(tower, t2f12).

/*Floor 3*/
area(tower, t3f1).
area(tower, t3f2).
area(tower, t3f3).
area(tower, t3f4).
area(tower, t3f5).

/*Specifies all connections within the tower*/
connected(t1f1, t1f2).
connected(t1f1, t1f3).
connected(t1f3, t1f4).
connected(t1f4, t1f5).
connected(t1f3, t1f6).
connected(t1f6, t1f7).
connected(t1f7, t1f8).
connected(t1f6, t1f9).
connected(t1f9, t1f10).
connected(t1f9, t1f11).

connected(t2f1, t2f2).
connected(t2f1, t2f3).
connected(t2f3, t2f4).
connected(t2f4, t2f5).
connected(t2f5, t2f6).
connected(t2f4, t2f7).
connected(t2f7, t2f8).
connected(t2f8, t2f9).
connected(t2f9, t2f10).
connected(t2f7, t2f11).
connected(t2f11, t2f12).

connected(t3f1, t3f2).
connected(t3f2, t3f3).
connected(t3f1, t3f4).
connected(t3f1, t3f5).
connected(t3f2, t3f4).
connected(t3f2, t3f5).


:- forall(connected(X,Y), assert(connected(Y,X))).