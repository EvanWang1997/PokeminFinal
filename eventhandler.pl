:- module(eventhandler,[
                    triggerEvent/1,
                    turnOffEvent/1,
                    endprogram/1]).

/** File for handling and triggering events*/
:- use_module(textmanager).
:- use_module(maincharacter).
:- use_module(trainers).
:- use_module(battle).

:- dynamic event/1.
:- dynamic hasevent/2.
:- discontiguous eventhandler:event/1.
:- discontiguous eventhandler:hasevent/2.
:- discontiguous eventhandler:checkOffCondition/1.

/* Checks if an event is still active at a location, and then starts it if on*/
triggerEvent(LOCATION) :-
    hasevent(LOCATION,1),
    event(LOCATION).
/* Default null event for trigger*/
triggerEvent(_).

/*Check if event for location should be turned off*/
checkOffCondition(LOCATION) :-
    mindead(false),
    turnOffEvent(LOCATION).

checkOffCondition(_) :-
    current(Zone,_),
    movearea(Zone),
    fail.

/* Turns off events for an area if it has already occurred*/
turnOffEvent(LOCATION):-
    retractall(hasevent(LOCATION,1)),
    asserta(hasevent(LOCATION,0)).

updateZone(1) :-
    movearea(bridge).

updateZone(2) :-
    movearea(tower).

updateZone(3) :-
    movearea(mountain).


/*Event denoted by associated location, and will not be run if has event is off
* at a specific location*/

                                    /* FOREST EVENTS*/  
                                    /****************/
                                    /****************/
                                    /****************/
hasevent(f1,1).
event(f1) :-
    line('You enter the forest, with the scent of sun and and flowers fil-'),nl,
    speak(???,'Hey there! You chose the wrong area to enter my friend'),nl,
    line('You turn to your side, and see a man approaching you'),nl,
    speak(min, 'Look, friend, I just want to head towards the city, if you could-'),
    speak(jeff, 'My name\'s Jeff, let\'s battle!'),
    speak(min, '...but why?'),nl,
    line('Bug Catcher Jeff would like to battle'),nl,
    battlemenu(min,bug_catcher_jeff),
    checkOffCondition(f1),
    speak(min, 'Okay, now, can you PLEASE just direct me to the city?'),
    speak(jeff, 'oh, yeah, just go left or right'),
    speak(min, 'what do you mean, which way\'s correct?'),
    speak(jeff, 'don\'t worry about it, just choose'),
    speak(min, 'that...didn\'t answer my question'),nl.
    

hasevent(f3,1).
event(f3) :-
    line('Bug Catcher Ted would like to battle'),nl,
    battlemenu(min,bug_catcher_ted),
    checkOffCondition(f3),
    speak(min,'Ah, so there was more than one crazy person in this forest'),!.

hasevent(f5,1).
event(f5) :-
    line('Bug Catcher Maxim would like to battle'),nl,
    battlemenu(min,bug_catcher_maxim),
    checkOffCondition(f5),
    speak(min,'If you guys are here to catch bugs, why pick fights!?!?'),!.

hasevent(f4,1).
event(f4) :-
    speak(???,'Ah, sorry, did you by chance encounter my brother in the forest?'),
    speak(julios,'My name is Julios, I heard you had beaten up my little brother'),
    speak(min,'Well, I mean, he kind of picked that fight'),
    speak(julios,'Yeah...I know, he\'s always saying that he wants to be the very best'),
    speak(julios,'or something like that...don\'t really get it'),
    speak(julios,'Unfortunately, as his big brother, I\'ll have you try and avenge him'),
    speak(julios,'Sorry about this, I hope you can understand'),
    speak(min,'Christ, I just wanted out of this forest...'),nl,
    line('Bug Catcher Julios would like to battle'),nl,
    battlemenu(min,bug_catcher_julios),
    checkOffCondition(f4),
    speak(min,'Once I get back to this forest, I swear, I\'m going to log every single tree in here!'),
    speak(min,'I\'d like to see any more of these bug catchers surprise me then...'),nl,
    line('Min exits the forest of one huge tree, and sees two paths in front of him'),
    line('A bridge, and a tower, please select where you would like to go next'),
    line('1. Convoluted Bridges'),
    line('2. Maztower'),nl,
    read(X),
    updateZone(X),!.
    
    


                                    /* HILL EVENTS*/  
                                    /****************/
                                    /****************/
                                    /****************/

hasevent(h1,1).
event(h1) :-
    line('Min has decided to come to biking hill, as he had heard that there were'),
    line('free bikes being given out here, which would speed up his journey'),nl,
    speak(min, 'Hey, are you the guy giving out bikes?'),
    speak(steve, 'Well, we are loaning out bikes, do you have the money for it?'),
    speak(min, 'Wait, you\'re not giving out the bikes?'),
    speak(steve, 'Of course not? Who would just give out bikes for free?'),
    speak(min, 'Hmm, maybe you\'maybe you\'ll give me a bike after I beat you up'),
    speak(steve, 'Wait, what?'),nl,
    line('Min would like to battle with Bike Manager Steve?'),
    battlemenu(min,bike_manager_steve),
    checkOffCondition(h1),
    speak(min, 'There, I\'ve beat you, will you give me a bike now?'),
    speak(steve, 'No! What made you think you beating me up would make me give you a bike?'),
    speak(min, 'Errrrrrrrrr'),
    speak(steve, 'Just walk up the hill like a normal person!'),
    speak(min, 'Fine...'),!.

hasevent(h2,1).
event(h2) :-
    line('Biker Brake would like to battle'),
    battlemenu(min,biker_blake),
    checkOffCondition(h2),!.

hasevent(h4,1).
event(h4) :-
    line('Biker Pedro would like to battle'),
    battlemenu(min,biker_pedro),
    checkOffCondition(h4),!.

hasevent(h3,1).
event(h3) :-
    line('Biker Wheelium would like to battle'),
    battlemenu(min,biker_wheelium),
    checkOffCondition(h3),!.

hasevent(h6,1).
event(h6) :-
    line('Biker Helmut would like to battle'),
    battlemenu(min,biker_helmut),
    checkOffCondition(h6),!.

hasevent(h5,1).
event(h5) :-
    line('As he was climbing, Min ended up falling down, this was not the right spot'),
    line('to climb'),
    line('roll roll roll roll roll'), sleep(1),
    line('roll roll roll roll roll'), sleep(1),
    line('roll roll roll roll roll'), sleep(1),
    goto(h1),!.

hasevent(h7,1).
event(h7) :-
    line('Min reaches the top of the hill, and sees everything in front of him'),nl,
    speak(min,'Finally! It felt like those hills were 90 degrees!'),nl,
    line('He sees his next possible destinations, a tower piercing the sky,'),
    line('and a mountain range'),nl,
    speak(min, '...what the hell...'),nl,
    line('Please select your next destination from the following:'),
    line('2. Maxtower'),
    line('3. Mountains, probably'),
    read(X),
    updateZone(X),!.

                                    /* BRIDGE EVENTS*/  
                                    /****************/
                                    /****************/
                                    /****************/


hasevent(b2,1).
event(b2) :-
    speak('Jack of the bridge', 'Hi! Welcome to our newly built bridges, could you please pay a toll?'),
    speak('Min', 'Wait, new bridge? A toll?'),
    speak('Jack of the bridge', 'Yeah, the previous bridge had failed a while back, so we built two bridges'),
    speak('Jack of the bridge', 'in order to replace them. However, the construction fees for both of them'),
    speak('Jack of the bridge', 'were quite high, so we\'re now charging a toll to make the money back.'),
    speak('Min', 'Why didn\'t you guys just build a single bridge again?'),
    speak('Jack of the bridge', 'Redundancy in the system'),
    speak(min, 'Dude, I\'m not about to pay for these stupid bridges'),
    speak(min, 'Since I have no money, so I\'ll need get past you the hard way!'),nl,
    line('Jack of the Bridge would like to battle'),nl,
    battlemenu(min,jack_of_the_bridge),
    checkOffCondition(b2),!.

hasevent(b4,1).
event(b4) :-
    speak('Min', 'Ahhhhh, umi da, I wonder what\'s beyond this sea...'),
    speak('Big Fish', 'It\'s me, I\'m beyond the sea'),
    speak('Min', 'Wait, is that a talking fis-'),nl,
    line('Fish of the sea would like to battle!'),nl,
    battlemenu(min,big_fish),
    checkOffCondition(b4),!.

hasevent(b6,1).
event(b6) :-
    speak('Jack of the bridge', 'Hi! Welcome to our newly built bridges, could you please pay a toll?'),
    speak('Min', 'Wait...Didn\'t I...back there...already...'),
    speak('Redundant Jack of the bridge', 'Ah, my name is Redundant Jack of the Bridge'),
    speak('Redundant Jack of the bridge', 'Since we built a redundant bridge, it felt like there needed to be'),
    speak('Redundant Jack of the bridge', 'a redundant version of me as well'),
    speak('Min', 'Wait...so are you the same person...a brother...a cousin???'),
    speak('Redundant Jack of the bridge', 'Don\'t worry about it'),nl,
    line('(Redundant) Jack of the Bridge would like to battle'),nl,
    battlemenu(min,redundant_jack_of_the_bridge),
    checkOffCondition(b6),!.

hasevent(b7,1).
event(b7) :-
    speak('Min', 'Wait...why do the bridges just...cross the river twice...'),
    speak('Min', 'I could just ignore the road completely...and walk past them...'),nl,
    line('And with that, Min heads off towards the city!'),nl,
    checkOffCondition(b7),
    movearea(city),!.

                                    /* TOWER EVENTS*/  
                                    /****************/
                                    /****************/
                                    /****************/

hasevent(t1f1,1).
event(t1f1) :-
    line('Min arrives at the entrance to the larger tower that he had seen,'),
    line('and sees a sign at the front of the entrance:'),nl,
    line('Research in progress, for business inquiries, please contact management'),nl,
    speak('Min', 'Smells like there\'s business opportunities here!'),nl,
    line('In pursuit of something to market, he goes up the tower'),nl,
    checkOffCondition(t1f1),!.

hasevent(t1f4,1).
event(t1f4) :-
    line('Researcher Chris would like to battle'),
    battlemenu(min,researcher_chris),
    checkOffCondition(t1f4),!.

hasevent(t1f9,1).
event(t1f9) :-
    line('Researcher Cindi would like to battle'),
    battlemenu(min,researcher_cindi),
    checkOffCondition(t1f9),!.

hasevent(t1f8,1).
event(t1f8) :-
    line('Researcher Allan would like to battle'),
    battlemenu(min,researcher_allan),
    checkOffCondition(t1f8),!.

hasevent(t2f6,1).
event(t2f6) :-
    line('Researcher Jonathan would like to battle'),
    battlemenu(min,researcher_jonathan),
    checkOffCondition(t2f6),!.

hasevent(t2f10,1).
event(t2f10) :-
    line('Researcher Eric would like to battle'),
    battlemenu(min,researcher_eric),
    checkOffCondition(t2f10),!.

hasevent(t2f11,1).
event(t2f11) :-
    line('Researcher Santa would like to battle'),
    battlemenu(min,researcher_santa),
    checkOffCondition(t2f11),!.

hasevent(t3f4,1).
event(t3f4) :-
    line('You\'ve stepped on a spike trap! Please be a bit more mindful of where you go!'),nl,
    speak('Min', 'who installs spike traps on the roof of a tower!?!?'),nl,
    goto(t3f1),!.

hasevent(t3f5,1).
event(t3f5) :-
    line('You\'ve stepped on a spike trap! Please be a bit more mindful of where you go!'),nl,
    speak('Min', 'who installs spike traps on the roof of a tower!?!?'),nl,
    goto(t3f1),!.

hasevent(t3f3,1).
event(t3f3) :-
    speak('Ryan', 'Who\'s this, and what are you doing in my tower?'),nl,
    speak('Min', 'Ah, so you\'re in charge? I came in looking for something I can ste- '),
    speak('Min', 'I mean, borrow, to advertise to a market'),
    speak('Ryan', 'Dude, most of my research involves private enterprises that need to be kept secret'),
    speak('Ryan', 'There\'s nothing you can take without bringing risk to the public market...'),
    speak('Min', 'Finnnneeee...but you have money right?'),
    speak('Ryan', 'Yes...but what do you-'),
    line('Min would like to extort Ryan!'),
    battlemenu(min, ryan_lee),
    checkOffCondition(t3f3),
    speak('Min', 'Alright, I won, now, pay me!'),
    speak('Ryan', 'Dude...you literally destroyed a ton of my equipment just now...'),
    speak('Min', 'Uh oh'),
    speak('Ryan', 'Get off my tower'),nl,
    line('Ryan kicks Min off the tower'),
    line('Min falls for a little while, suffering from a bit of fall damage'),nl,
    speak('Min', 'Owww...well...that wasn\'t very profitable'),
    speak('Min', 'At least I can see the city from here!'),nl,
    movearea(city),!.

                                    /* MOUNTAIN EVENTS*/  
                                    /****************/
                                    /****************/
                                    /****************/
hasevent(m1,1).
event(m1) :-
    speak('Min', 'Well, I\'m here...but now what'),nl,
    line('Having arrived at the foot of the mountains, Min has a few options, to go'),
    line('around the mountains, or to go over them'),
    line('Either way, it\'s going to be a pain'),nl,
    checkOffCondition(m1),!.

hasevent(m2,1).
event(m2) :-
    line('Deciding to go up the mountain (in order to avoid potential nuisances)'),
    line('Min gradually goes up the mountain'), sleep(1),
    line('he goes up'),sleep(1),
    line('and up'),sleep(1),
    line('and up'),sleep(1),
    line('and up'),sleep(3),
    line('and then realizes he need to go down...'),nl,!.

hasevent(m3,1).
event(m3) :-
    speak('Kant', 'Only in serving everyone, does one benefit'),
    speak('Min', 'Sigh...are there going to be more of you preachers here...?'),nl,
    line('Monk Kant would like to battle'),nl,
    battlemenu(min, monk_kant),
    checkOffCondition(m3),!.

hasevent(m4,1).
event(m4) :-
    speak('Marx', 'Serve each other, and everything is just'),
    speak('Min', 'Eh, sometimes it\'s better for it to be a bit more just for a specific person'),nl,
    line('Monk Marx would like to battle'),
    battlemenu(min, monk_marx),
    checkOffCondition(m4),!.


hasevent(m6,1).
event(m6) :-
    line('In trying to avoid trainers, Min walks up another mountain, but...'),nl,
    speak('Locke', 'A journey is filled with many encounters, some unxpected'),
    speak('Min', 'God, I walked up this mountain to specifically avoid you people!'),nl,
    line('Monk Locke would like to battle'),
    battlemenu(min, monk_locke),
    checkOffCondition(m6),!.

hasevent(m7,1).
event(m7) :-
    speak('Platato', 'So, how was your journay across these mountains'),nl,
    speak('Min', 'Sir, I just climbed a series of hills and then this mountain, I\'m'),
    speak('Min', 'not in the most talkative mood right now'),
    speak('Platato', 'But you learned much from it, no?'),
    speak('Min', 'Yes, I get it, everything has a lesson, I just wanted to go to the city though'),
    speak('Platato', 'Then all you need to do is pass me'),
    speak('Min', 'Jesus Christ'),
    line('Philosopher Platato has appeared before you'),nl,
    battlemenu(min, platato),
    checkOffCondition(m7),
    speak('Min', 'Alright...we\'re finally done...'),
    speak('Platato', 'Strong, you have become'),nl,
    line('Completly ignoring the man, Min moves on with his life'),
    line('With this, min heads towards the city'),nl,
    movearea(city),!.


                                    /* CITY EVENTS*/  
                                    /****************/
                                    /****************/
                                    /****************/

hasevent(c1,1).
event(c1) :-
    line('After a long journey, Min has finally arrived in the big city'),nl,
    speak('Min','Okay, first I\'ll begin by sampling the local cuisine, and then see'),
    speak('Min', 'If there are are issues that can be solved by...marketable solutions'),
    speak('Min', 'by talking to the locals!'),nl,
    checkOffCondition(c1),
    line('Welcome to the city!'),!.

hasevent(c4,1).
event(c4) :-
    speak('Min', 'Mhmmmm, smells good! What are you selling there shopkeep?'),
    speak('Shopkeep', 'Fried chicken lad! Two pieces for $5!'),
    speak('Min', 'Ah, I just got into town...could you just let me sample a bit intead-'),
    speak('Shopkeep', 'Of course son! It must have been a long journey!'),
    speak('Min','Ah...er, thanks!'),nl,
    line('Shopkeep Sanders would like to battle!'),nl,
    speak('Min', 'wait, what?'),
    speak('Shopkeep Sanders', 'Has to be done son, that\'s just how things go!'),
    battlemenu(min, shopkeep_sanders),
    checkOffCondition(c4),
    speak('ShopKeep Sanders', 'Hahaha, good job lad, as promised, here\'s your chicken!'),nl,!.

hasevent(c7,1).
event(c7) :-
    speak('Min', 'Mhmmmm, smells good! What are you selling there shopkeep?'),
    speak('Shopkeep Ichiga', 'It\'s just ramen innit?'),
    speak('Min', 'eh...can I...get some?'),
    speak('Shopkeep Ichiga', 'Well,you know the deal as usual'),
    speak('Min', 'yeah yeah...I know...'),nl,
    line('Shopkeep Ichiga would like to battle'),nl,
    battlemenu(min, shopkeep_ichiga),
    checkOffCondition(c7),
    speak('Shopkeep Sanders', 'Not bad eh son, here be ya ramen!'),nl,!.

hasevent(c6,1).
event(c6) :-
    line('Arriving at the doorstep of a house, and seeing that the door was unlocked,'),
    line('Min decides to peek in to see if anyone was home, and ask them if they had'),
    line('Any issues he could help resolve'),nl,
    speak('Min', 'Hey!! Anyone there, I\'m just passing by and saw your door was-'),
    speak('Grandpa Joe', 'Who in the holler are you!?!? And why are you just boldly'),
    speak('Grandpa Joe', 'walking into our house!?!?'),
    speak('Min', 'Ah, no, I just wanted to ask if you-'),
    speak('Grandpa Joe', 'The audacity of young people these days, what in the world!?!?'),nl,
    line('Grandpa Joe is trying to kick you out of his house!'),
    battlemenu(min, grandpa_joe),
    checkOffCondition(c6),
    speak('Grandpa Joe', 'And never come back! Or at least be invited next time!'),
    speak('Min', 'Okay, note to self, don\'t just walk into strangers\' houses'),nl,!.

hasevent(c9,1).
event(c9) :-
    speak('Flowerseller Grace', 'Hey mister! Take a look at my flowers!'),
    speak('Min', 'Oh wow! There are some varieties that I haven\'t even seen in the wild!'),
    speak('Min', 'I wonder what medicinal properties some of them might have...'),nl,
    line('Wanting a closer look, Min picks up a flower'),nl,
    speak('Flowerseller Grace', 'Okay, you picked it up, now buy it'),
    speak('Min', 'Woah there, I just wanted a closer look at it'),
    speak('Flowerseller Grace', 'Yeah, but it\'s value goes down after someone handles it'),
    speak('Flowerseller Grace', 'If you\'re not willing to pay up...force will have to be used mister...'),
    speak('Min', 'eh?'),nl,
    line('Flowerseller Grace is forcing you to pay up for the flowers'),nl,
    battlemenu(min, flowerseller_grace),
    checkOffCondition(c9),
    speak('Flowerseller Grace', 'Fine...I\'ll let you off this time, just don\'t'),
    speak('Flowerseller Grace', ' touch my goods so easily next time!'),
    speak('Min', 'Yes m\'am'),nl,!.

hasevent(c3,1).
event(c3) :-
    line('Having gone through the city, Min arrives at the trading hub in the center of the city'),
    line('However, as he approaches it...'),nl,
    speak('Yourself', 'Well, here we are, where we wanted to go after leaving home...'),
    speak('Min', 'Wait, who is this...!?!?'),
    speak('Yourself', 'It\'s me, your conscious, just checking up on you'),
    speak('Min', 'Wow...didn\'t even know I had one'),
    speak('Yourself', 'Yeah, I didn\'t know I had one either. I just wanted to ask if you were happy'),
    speak('Min', 'Of course I am! We finally made it here, at the heart of the entire countr\'s econcomy!'),
    speak('Yourself', 'Yeah, but what will you do now?'),
    speak('Min', 'What do you mean?'),
    speak('Yourself', 'There were so many good...if not interesting...people that we met, including'),
    speak('Yourself', 'including in this city. Instead of working a lifetime to further our own wealth'),
    speak('Yourself', 'don\'t you want to go out and meet more of them? And help them along the way?'),
    speak('Min', 'Wait, are you, am I, making this to be the moral of the story right now?'), 
    speak('Yourself', 'Yes, so let\'s see who\'s right here then'),nl,
    line('You would like to battle with yourself...?'),nl,
    battlemenu(min, yourself),
    checkOffCondition(c3),
    speak('Yourself', 'See, we won, didn\'t we'),
    speak('Min', 'No....I won...'),
    speak('Yourself', 'Yeah, but I\'m you, so there\'s that'),
    speak('Min', 'Er...fine'),nl,
    line('And with that, Min confronted his inner self, and learned to balance his desire for capitalism'),
    line('and a curiosity for what\'s out there in the world'),
    line('Yeah, sorry, that\'s the best moral I could come up with'),nl,
    retract(endprogram(_)),
    asserta(endprogram(true)),!.

/*Specifies an end condition to the entire program*/
:- dynamic(endprogram/1).
endprogram(false).




