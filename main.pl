/*  File:    main.pl
    Purpose: Load the program
*/


/*Imports the textmanager module to make line formatting simpler*/

testload :-
    use_module(areas),
    use_module(textmanager),
    use_module(maincharacter),
    use_module(eventhandler),
    use_module(battle),
    use_module(startevents).

/*Launches the entire program, initiates movemenu after writing a few prompts*/
pokemin :-
    testload,
    storyStart,
    /*Filler for initializing location*/
    movemenu.


/*Primary menu for navigation, and knowing where you can go*/
movemenu :-
    repeat,
    look,
    write('Below are your options for what you can do'),nl,
    write('1. Move to another location'),nl,
    write('2. Switch your mins'),nl,
    write('3. Encounter new minster'),nl,
    read(X),
    processmove(X),
    endprogram(true).

/*Allows the user to take a look at next potential locations*/
look :-
    current(Zone, Place),
    write('Min is in '), write(Zone), nl,
    write('specifically in area '), write(Place), nl,nl,
    write('You can go to:'),nl,
    list_connections(Place),nl.

/* Lists all connections from the current area*/
list_connections(Place) :-
    connected(Place, X),
    tab(2),
    write(X),
    nl,
    fail.
list_connections(_).

/*Reads a new location from the command, and asserts it to be the current location*/
read_move() :-
    write('please select an area to move to'),
    nl,
    read(New),nl,
    current(Zone,S),
    connected(S,New),
    retractall(current(Zone,S)),
    asserta(current(Zone,New)),
    triggerEvent(New).

/*Default result for read move*/
read_move().

/** Primary menu selections */
processmove(1) :-
    read_move().

/** TODO: Add display for current minsters in party*/
processmove(2) :-
    switchPokemin().

/** TODO: Initialize random event for challenging a new minster */
processmove(3) :-
    wildencountermenu().

processmove(_).





    
    
