:- module(battle,[battlemenu/2, wildencountermenu/0]).

:- use_module(maincharacter).
:- use_module(trainers).
:- use_module(minsters).
:- use_module(moves).
:- use_module(maincharacter).

:- dynamic(battleover/1).
battleover(true).



/*Primary menu for navigation, and knowing where you can go*/
battlemenu(Trainer1, Trainer2) :-
    retract(battleover(_)),
    asserta(battleover(false)),
    retract(mindead(_)),
    asserta(mindead(false)),
    battle_while(endcondition(), Trainer1, Trainer2).

% /*Default state following a battle*/
% battlemenu(Trainer1,Trainer2).

battle_while(Condition, Trainer1, Trainer2) :-
    (Condition -> true;
        getbattlemin(Trainer1, Pokemin1),
        getbattlemin(Trainer2, Pokemin2),
        displaypokemin(Pokemin1, Pokemin2),
        write('Below are your options for what you can do'), nl,
        write('1. Fight like a min'), nl, nl,
        read(X),
        processbattlemove(X, Pokemin1, Pokemin2),
        battle_while(Condition, Trainer1, Trainer2)),!.

displaypokemin(minster(_, N1, _, stats(L1, CH1, _, _, _), _, moveset(M11, M12, M13, M14)),
minster(_, N2, _, stats(L2, CH2, _, _, _), _, _)) :-
    getmove(M11, D11, T11), getmove(M12, D12, T12), getmove(M13, D13, T13), getmove(M14, D14, T14),
    write('                                                '), write(N2), write(' Lv. '), write(L2), nl,
    write('                                                HP: '), write(CH2), nl, nl,
    write(N1), write(' Lv. '), write(L1), nl,
    write('HP: '), write(CH1), nl,
    write('1. '), write(M11), write('['), write(T11), write(']: '), write(D11),nl,
    write('2. '), write(M12), write('['), write(T12), write(']: '), write(D12), nl,
    write('3. '), write(M13), write('['), write(T13), write(']: '), write(D13), nl,
    write('4. '), write(M14), write('['), write(T14), write(']: '), write(D14), nl.


%                                                 Pokemin Lv. 5
%                                                 HP: 1

% Pokemin Lv. 5
% HP: 1
% 1. Attack1(Element): Damage
% 2. Attack2(Element): Damage
% 3. Attack3(Element): Damage
% 4. Attack4(Element): Damage


/** Primary menu selections */
% isMins(1, P1), isMins(2, P2), processbattlemove(1, P1, P2).
processbattlemove(1, Pokemin1,Pokemin2) :-
    attack(Pokemin1, Pokemin2).

processbattlemove(_, _, _).

attack(Pokemin1,Pokemin2):-
    getmoveset(Pokemin1, Move1, Move2, Move3, Move4),
    write('Choose a move'), nl,
    write('1. '), write(Move1), nl,
    write('2. '), write(Move2), nl,
    write('3. '), write(Move3), nl,
    write('4. '), write(Move4), nl, nl,
    read(X),
    processattack(X, Pokemin1, Pokemin2).

processattack(1, Pokemin1, Pokemin2) :-
    getmoveset(Pokemin1, Move1, _, _, _),
    getmove(Move1, Damage1, Type1),
    attackhelper(Pokemin1, Pokemin2, Move1, Damage1, Type1).

processattack(2, Pokemin1, Pokemin2) :-
    getmoveset(Pokemin1, _, Move2, _, _),
    getmove(Move2, Damage2, Type2),
    attackhelper(Pokemin1, Pokemin2, Move2, Damage2, Type2).

processattack(3, Pokemin1, Pokemin2) :-
    getmoveset(Pokemin1, _, _, Move3, _),
    getmove(Move3, Damage3, Type3),
    attackhelper(Pokemin1, Pokemin2, Move3, Damage3, Type3).

processattack(4, Pokemin1, Pokemin2) :-
    getmoveset(Pokemin1, _, _, _, Move4),
    getmove(Move4, Damage4, Type4),
    attackhelper(Pokemin1, Pokemin2, Move4, Damage4, Type4).

processattack(_, _, _).

attackhelper(Pokemin1, Pokemin2, Move, Damage, Type) :-
    getstats(Pokemin1, stats(_, _, _, A1, _)),
    getstats(Pokemin2, stats(L2, CH2, MH2, A2, D2)),
    getdetails(Pokemin1, _, N1, _, _, _, _),
    getdetails(Pokemin2, ID2, N2, T2, _, P2, M2),
    write(N1), write(' used '), write(Move), nl, sleep(1),
    gettypemodifier(Type, T2, Modifier),
    processdamage(Damage, A1, CH2, D2, Modifier, HP2_NEW),
    retract(Pokemin2),
    asserta(minster(ID2, N2, T2, stats(L2, HP2_NEW, MH2, A2, D2), P2, M2)),
    opponentdead(ID2),
    opponentturn(Pokemin1, Pokemin2).

opponentdead(ID) :-
    isMins(ID, minster(_, N2, _, stats(_, CH, _, _, _), _, _)),
    CH < 1,
    write('Opponent '), write(N2), write(' \'fainted\'.'), nl, sleep(1),
    write('Min won the battle.'), nl, sleep(1),
    write('Your party leveled up.'), nl, sleep(1),
    levelupparty(),
    retract(battleover(_)),
    asserta(battleover(true)).

opponentdead(_).

opponentturn(Pokemin1, Pokemin2) :-
    battleover(false),
    random(1, 4, Y),
    opponentattack(Y, Pokemin1, Pokemin2).

opponentturn(_, _).

opponentattack(1, Pokemin1, Pokemin2) :-
    getmoveset(Pokemin2, Move1, _, _, _),
    getmove(Move1, Damage1, Type1),
    opponentattackhelper(Pokemin1, Pokemin2, Move1, Damage1, Type1).

opponentattack(2, Pokemin1, Pokemin2) :-
    getmoveset(Pokemin2, _, Move2, _, _),
    getmove(Move2, Damage2, Type2),
    opponentattackhelper(Pokemin1, Pokemin2, Move2, Damage2, Type2).

opponentattack(3, Pokemin1, Pokemin2) :-
    getmoveset(Pokemin2, _, _, Move3, _),
    getmove(Move3, Damage3, Type3),
    opponentattackhelper(Pokemin1, Pokemin2, Move3, Damage3, Type3).

opponentattack(4, Pokemin1, Pokemin2) :-
    getmoveset(Pokemin2, _, _, _, Move4),
    getmove(Move4, Damage4, Type4),
    opponentattackhelper(Pokemin1, Pokemin2, Move4, Damage4, Type4).

opponentattackhelper(Pokemin1, Pokemin2, Move, Damage, Type) :-
    getstats(Pokemin1, stats(L1, CH1, MH1, A1, D1)),
    getstats(Pokemin2, stats(_, _, _, A2, _)),
    getdetails(Pokemin1, ID1, N1, T1, _, P1, M1),
    getdetails(Pokemin2, _, N2, _, _, _, _),
    printopponentattack(N2, Move),
    gettypemodifier(Type, T1, Modifier),
    processdamage(Damage, A2, CH1, D1, Modifier, HP1_NEW),
    retract(Pokemin1),
    asserta(minster(ID1, N1, T1, stats(L1, HP1_NEW, MH1, A1, D1), P1, M1)),
    isdead(ID1).

isdead(ID) :-
    isMins(ID, minster(_, N1, _, stats(_, CH, _, _, _), _, _)), CH < 1,
    write(N1), write(' \'fainted\'.'), nl, sleep(1),
    write('Min lost the battle.'), nl, sleep(3),
    write('...'), nl, sleep(1),
    write('...'), nl, sleep(1),
    write('...'), nl, sleep(1),
    write('Min wakes up with a headache.'), nl, sleep(1),
    write('Maybe he just had a bad dream.'), nl, sleep(1),
    retract(battleover(_)),
    asserta(battleover(true)),
    retract(mindead(_)),
    asserta(mindead(true)),
    resetparty().

isdead(_).

printopponentattack(N2, Move) :-
    battleover(false),
    write('Opponent '), write(N2), write(' used '), write(Move), nl, sleep(1).

processdamage(Damage, A, CH, D, Modifier, HP_NEW) :-
    CH - (integer(Damage*A/D*Modifier/8)) < 1,
    HP_NEW is 0.

processdamage(Damage, A, CH, D, Modifier, HP_NEW) :-
    HP_NEW is (CH - (integer(Damage*A/D*Modifier/8))).
    % ((Modifier*(integer(Damage*A/100) - D)) < (integer(1*A/100) + 1) -> HP_NEW is (CH - (integer(1*A/100) + 1)); HP_NEW is (CH - (Modifier*(integer(Damage*A/100) - D)))).

wildencountermenu() :-
    random(40, 90, ID),
    getbattlemin(min, minster(_, _, _, stats(L, _, _, _, _), _, _)),
    Lower is L-4, Upper is L-2,
    random(Lower, Upper, Level),
    isMins(ID, P),
    levelwild(Level, P),
    retract(trainer(wild, _)),
    asserta(trainer(wild, ID)),
    battlemenu(min, wild),
    resetminster(P).

/*Specifies an end condition to the entire program*/
endcondition() :-
    battleover(true).
