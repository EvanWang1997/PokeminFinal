:- module(areas,[area/2,connected/2]).

/*File that specifies all areas within the world*/

:- discontiguous areas:area/2.
:- discontiguous areas:connected/2.
/*Specifies all areas within the forest*/
area(forest,f1).
area(forest,f2).
area(forest,f3).
area(forest,f4).
area(forest,f5).
area(forest,f6).

:- dynamic connected/2.
/*Connects all areas in the forest together*/
connected(f1,f2).
connected(f2,f3).
connected(f3,f4).
connected(f4,f5).
connected(f5,f6).
connected(f6,f1).

/*Specifies all areas within the hills*/

area(hills, h1).
area(hills, h2).
area(hills, h3).
area(hills, h4).
area(hills, h5).
area(hills, h6).
area(hills, h7).

/*Connects all areas in the hills together*/
connected(h1,h5).
connected(h1,h2).
connected(h1,h3).
connected(h2,h4).
connected(h3,h6).
connected(h4,h7).
connected(h6,h7).

/*Specifies all areas within the bridge area*/

area(bridge, b1).
area(bridge, b2).
area(bridge, b3).
area(bridge, b4).
area(bridge, b5).
area(bridge, b6).
area(bridge, b7).

/*Specifies all connections within the bridge area*/
connected(b1, b2).
connected(b1, b7).
connected(b2, b3).
connected(b3, b4).
connected(b4, b5).
connected(b3, b5).
connected(b5, b6).
connected(b6, b7).

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

connected(t1f11,t2f1).

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

connected(t2f12,t3f1).

connected(t3f1, t3f2).
connected(t3f2, t3f3).
connected(t3f1, t3f4).
connected(t3f1, t3f5).
connected(t3f2, t3f4).
connected(t3f2, t3f5).

/*Specifies all areas within the mountains area*/

area(mountain, m1).
area(mountain, m2).
area(mountain, m3).
area(mountain, m4).
area(mountain, m5).
area(mountain, m6).
area(mountain, m7).
area(mountain, m8).
area(mountain, m9).

/*Specifies all connections within the mountain area*/
connected(m1,m2).
connected(m1,m3).
connected(m1,m4).
connected(m2,m5).
connected(m3,m5).
connected(m4,m5).
connected(m5,m6).
connected(m5,m7).
connected(m5,m8).
connected(m6,m9).
connected(m7,m9).
connected(m8,m9).

/*Specifies all areas within the city area*/
area(city, c1).
area(city, c2).
area(city, c3).
area(city, c4).
area(city, c5).
area(city, c6).
area(city, c7).
area(city, c8).
area(city, c9).

/*Specifies all connections within the city area*/
connected(c1,c2).
connected(c2,c3).
connected(c1,c4).
connected(c4,c5).
connected(c5,c6).
connected(c2,c6).
connected(c1,c7).
connected(c7,c8).
connected(c8,c9).
connected(c2,c9).


:- forall(connected(X,Y), assert(connected(Y,X))).