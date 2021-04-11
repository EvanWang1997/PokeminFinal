/*Module containing story starting events, such as the following:
- Informs the user of what is occuring in the story
- TODO: Allows the user to select their starting team
- select their starting area*/

:- module(startevents,[storyStart/0,updateFirst/1]).

/*Imports the textmanager module to make line formatting simpler*/

storyStart :-
    use_module(maincharacter),
    use_module(textmanager),
    line('This is the story of Min, a young man who wants to journey across the country.'),
    line('In order to become the very best... at venture capitalism.'),
    line('Due to growing up in a small town, he has been far disconnected from industry,'),
    line('as such, he has decided going out and seeing everything is the best course of action'),nl,
    speak(min, 'That is why I decided to leave home, starting right now!'),
    speak(mother, 'Alright, but remember to pick up dinner on your way home!'),
    speak(min, 'Eh...but what my minsters?'),
    speak(mother, 'Oh right, here, some spares that I have'),
    speak(min, 'Well, thats great, \' but now where do I go first?'),nl,
    line('You can go the following locations:'),
    line('1. The Forest of One Huge Tree'),
    line('2. Biking Hill'), nl,
    line('Please enter the number for where you\'d like to go'),nl,
    read(Loc),
    updateFirst(Loc).

/* Updates current position with option the user decided on*/
updateFirst(1) :-
    movearea(forest).

updateFirst(2) :-
    movearea(hills).









