:- module(trainers,[isTrainer/2,getbattlemin/2,trainer/2]).
:- use_module(minsters).
% isMins(N, minster(N, stats(L, CH, MH, A, D), powerup(HU, AU, DU))):-
%     minster(N, stats(L1, CH1, MH1, A1, D1), powerup(HU1, AU1, DU1)),
%     L is L1,
%     CH is CH1,
%     MH is MH1,
%     A is A1,
%     D is D1,
%     HU is HU1,
%     AU is AU1,
%     DU is DU1.

isTrainer(N, trainer(TN, ID)):-
    N = TN,
    trainer(N, ID).

getbattlemin(TN, P) :-
    isTrainer(TN, trainer(TN, ID)),
    isMins(ID, P).

% each minster has a name and a set of stats. stats consist of level, current hp, max hp, attack, defense, and a power up value(increase in stats per level).

:- dynamic trainer/2.
trainer(min, 1).

trainer(bug_catcher_jeff, 10).
trainer(bug_catcher_julios, 11).
trainer(bug_catcher_ted, 12).
trainer(bug_catcher_maxim, 13).

trainer(bike_manager_steve, 14).
trainer(biker_blake, 15).
trainer(biker_pedro, 16).
trainer(biker_wheelium, 17).
trainer(biker_helmut, 18).

trainer(jack_of_the_bridge,19).
trainer(redundant_jack_of_the_bridge, 20).
trainer(big_fish, 21).

trainer(researcher_cindi, 22).
trainer(researcher_chris, 23).
trainer(researcher_allan, 24).
trainer(researcher_jonathan, 25).
trainer(researcher_eric, 26).
trainer(researcher_santa, 27).
trainer(ryan_lee, 28).

trainer(monk_kant, 29).
trainer(monk_marx, 30).
trainer(monk_locke, 31).
trainer(monk_niet, 32).

trainer(platato, 33).

trainer(shopkeep_sanders, 34).
trainer(shopkeep_ichiga, 35).
trainer(grandpa_joe, 36).
trainer(flowerseller_grace, 37).
trainer(yourself, 38).

/*Additional trainers*/
/**
 * shopkeep_sanders
 * shopkeep_ichiga
 * grandpa_joe
 * flowerseller_grace*/


trainer(wild, 40).