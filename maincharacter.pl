:- module(maincharacter,[current/2,movearea/1,startzone/2,goto/1, mindead/1, switchPokemin/0]).
:- use_module(trainers).
:- use_module(minsters).
% :- use_module(stats).
:- use_module(moves).
/* Module that contains information on the main character, should be dynamic,
* but should be updatable based on new information in the story*/

/*Specified the current zone and location that min is at*/
/* Initialized with a dummy value for now*/
:- dynamic current/2.
current(null, n1).

:- dynamic money/1.
money(0).

:- dynamic mindead/1.
mindead(false).

/* Moves the player to the starting point of a specified area*/
movearea(New) :-
    startzone(New,S),
    retractall(current(_,_)),
    asserta(current(New,S)),
    triggerEvent(S).

/*Moves to a specific area within the same zone*/
goto(New) :-
    current(Zone,_),
    area(Zone,New),
    retractall(current(Zone,_)),
    asserta(current(Zone,New)).

startzone(forest,f1).
startzone(hills,h1).
startzone(bridge,b1).
startzone(tower,t1f1).
startzone(mountain,m1).
startzone(city,c1).

displayminster(minster(ID, N, _, stats(L, CH, _, A, D), _, moveset(M1, M2, M3, M4))) :-
    getmove(M1, D1, T1), getmove(M2, D2, T2), getmove(M3, D3, T3), getmove(M4, D4, T4),
    write(ID), write('. '), write(N), write('['), write(T1), write('] Lv. '), write(L), nl,
    write('HP: '), write(CH), write('      '), write('ATK: '), write(A), write('      '), write('DEF: '), write(D), nl,
    write(M1), write('['), write(T1), write(']: '), write(D1), write('      '), write(M2), write('['), write(T2), write(']: '), write(D2), nl,
    write(M3), write('['), write(T3), write(']: '), write(D3), write('      '), write(M4), write('['), write(T4), write(']: '), write(D4), nl, nl.

switchPokemin() :-
    isMins(1, P1), displayminster(P1),
    isMins(2, P2), displayminster(P2),
    isMins(3, P3), displayminster(P3),
    isMins(4, P4), displayminster(P4),
    isMins(5, P5), displayminster(P5),
    isMins(6, P6), displayminster(P6),
    write('Select the Pokemin you would like to use'), nl,
    read(P),
    P < 7, P > 0,
    retract(trainer(min, _)),
    asserta(trainer(min, P)).
