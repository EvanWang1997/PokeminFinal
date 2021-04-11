:- module(forest,[area/2,connected/2]).

/*imports eventhandler in order to trigger events at vertain locations*/
use_module([eventhandler,
            textmanager
            ]).

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
% connected(f1,f6).
% connected(f6,f5).
% connected(f5,f4).
% connected(f4,f3).
% connected(f3,f2).
% connected(f2,f1).

/*Specifies that all patts are connected in reverse as well, allowing for
Min to travel in a circle in either direction*/
:- forall(connected(X,Y), assert(connected(Y,X))).








