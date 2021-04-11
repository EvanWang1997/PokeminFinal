:- module(hills,[area/2,connected/2]).

/*Specifies all areas within the hills*/

area(hills, h1).
area(hills, h2).
area(hills, h3).
area(hills, h4).
area(hills, h5).
area(hills, h6).
area(hills, h7).

:- dynamic connected/2.
/*Connects all areas in the hills together*/
connected(h1,h5).
connected(h1,h2).
connected(h1,h3).
connected(h2,h4).
connected(h3,h6).
connected(h4,h7).
connected(h6,h7).

:- forall(connected(X,Y), assert(connected(Y,X))).

/*Sets where the he might fall if he fails something*/
falls(h5,h1).
falls(h2,h1).
falls(h3,h1).
falls(h4,h2).
falls(h6,h3).

