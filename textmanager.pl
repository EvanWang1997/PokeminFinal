/* Module for handling spoken lines, can be used to circumvent formatting*/

:- module(textmanager,[line/1,speak/2]).

/*Writes the input line, along with a new line*/
line(X) :-
    write(X),nl,
    sleep(1).

/*Takes a user, writes their name, and then the line they speak*/
speak(Name, Words):-
    write(Name),
    write(': '),
    write(Words), nl,
    sleep(1).
