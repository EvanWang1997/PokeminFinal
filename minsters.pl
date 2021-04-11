:- module(minsters,[isMins/2, getstats/2, getdetails/7, getmoveset/5, levelupparty/0, resetparty/0, minster/6, resetminster/1, levelup/1, levelwild/2, gettypemodifier/3]).
% :- use_module(stats).
:- use_module(moves).
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

isMins(ID, minster(ID1, N, T, S, P, M)):-
    ID = ID1,
    minster(ID, N, T, S, P, M).

getstats(minster(_, _, _, stats(L, CH, MH, A, D), _, _), stats(L, CH, MH, A, D)).
getdetails(minster(ID, N, T, S, P, M), ID, N, T, S, P, M).

getmoveset(minster(_, _, _, _, _, moveset(M1, M2, M3, M4)), M1, M2, M3, M4).

levelup(minster(ID, N, T, stats(L, _, MH, A, D), powerup(HU, AU, DU), moveset(M1, M2, M3, M4))) :-
    L < 100,
    retract(minster(ID, _, _, _, _, _)),
    L_NEW is L + 1,
    MH_NEW is integer((MH - ((L-1)*HU)) + (L*HU)),
    A_NEW is integer((A - ((L-1)*AU)) + (L*AU)),
    D_NEW is integer((D - ((L-1)*DU)) + (L*DU)),
    asserta(minster(ID, N, T, stats(L_NEW, MH_NEW, MH_NEW, A_NEW, D_NEW), powerup(HU, AU, DU), moveset(M1, M2, M3, M4))).

levelwild(Level, minster(ID, N, T, stats(_, _, MH, A, D), powerup(HU, AU, DU), moveset(M1, M2, M3, M4))) :-
    Level < 101,
    retract(minster(ID, _, _, _, _, _)),
    MH_NEW is integer(MH + (Level*HU)),
    A_NEW is integer(A + (Level*AU)),
    D_NEW is integer(D + (Level*DU)),
    asserta(minster(ID, N, T, stats(Level, MH_NEW, MH_NEW, A_NEW, D_NEW), powerup(HU, AU, DU), moveset(M1, M2, M3, M4))).

resetminster(minster(ID, N, T, stats(L, _, MH, A, D), P, M)) :-
    retractall(minster(ID, _, _, _, _, _)),
    asserta(minster(ID, N, T, stats(L, MH, MH, A, D), P, M)).

levelupparty() :-
    isMins(1, P1), levelup(P1),
    isMins(2, P2), levelup(P2),
    isMins(3, P3), levelup(P3),
    isMins(4, P4), levelup(P4),
    isMins(5, P5), levelup(P5),
    isMins(6, P6), levelup(P6).

resetparty() :-
    isMins(1, P1), resetminster(P1),
    isMins(2, P2), resetminster(P2),
    isMins(3, P3), resetminster(P3),
    isMins(4, P4), resetminster(P4),
    isMins(5, P5), resetminster(P5),
    isMins(6, P6), resetminster(P6).


% each minster has a name and a set of stats. stats consist of level, current hp, max hp, attack, defense, and a power up value(increase in stats per level).

:- dynamic minster/6.
% min
minster(1, charminder, fire, stats(5, 21, 21, 12, 12), powerup(2.1, 1.5, 1.3), moveset(tackle, ember, dragon_breath, fire_fang)).
minster(2, greminja, water, stats(5, 23, 23, 17, 13), powerup(2.7, 2.4, 1.7), moveset(aqua_jet, dark_pulse, water_shuriken, ice_beam)).
minster(3, abominsnow, grass, stats(5, 26, 26, 16, 15), powerup(3.1, 2.1, 2), moveset(razor_leaf, grassy_glide, blizzard, earthquake)).
minster(4, mingeotto, flying, stats(5, 23, 23, 12, 12), powerup(2.6, 1.5, 1.4), moveset(slash, air_slash, fly, u_turn)).
minster(5, minchamp, fighting, stats(5, 26, 26, 19, 15), powerup(3.1, 2.9, 2), moveset(brick_break, cross_chop, take_down, ice_punch)).
minster(6, sheminja, ghost, stats(5, 1, 1, 16, 11), powerup(0, 2.1, 1.2), moveset(shadow_claw, phantom_force, x_scissor, night_slash)).

% bug_catcher_jeff
minster(10, bulbamin, grass, stats(4, 19, 19, 11, 11), powerup(2.2, 1.6, 1.6), moveset(mega_drain, sludge_wave, sludge_bomb, absorb)). %sludge wave sludge bomb
% bug_catcher_julios
minster(11, mindorina, poison, stats(10, 37, 37, 20, 21), powerup(2.7, 1.5, 1.6), moveset(tackle, poison_sting, poison_jab, mud_shot)).
% bug_catcher_ted
minster(12, mintapod, bug, stats(8, 29, 29, 11, 16), powerup(2.3, 0.8, 1.4), moveset(tackle, splash, harden, bug_buzz)).
% bug_catcher_maxim
minster(13, chesmin, grass, stats(6, 24, 24, 14, 14), powerup(2.4, 1.5, 1.6), moveset(leafage, razor_leaf, needle_arm, circle_throw)).
% bike_manager_steve
minster(14, minplup, water, stats(4, 20, 20, 11, 11), powerup(2.4, 1.5, 1.4), moveset(peck, bubble_beam, water_gun, metal_claw)).
% biker_blake
minster(15, minkey, normal, stats(6, 19, 19, 12, 10), powerup(2.1, 1.9, 1.2), moveset(scatch, tackle, circle_throw, rock_smash)).
% biker_pedro
minster(16, hitminlee, fighting, stats(7, 26, 26, 24, 22), powerup(2.3, 2.7, 2.5), moveset(karate_chop, circle_throw, sucker_punch, double_kick)).
% biker_wheelium
minster(17, hitminchan, fighting, stats(10, 33, 33, 29, 30), powerup(2.3, 2.4, 2.5), moveset(dynamic_punch, fire_punch, ice_punch, thunder_punch)).
% biker_helmut
minster(18, minetric, electric, stats(10, 37, 37, 29, 20), powerup(2.7, 2.4, 1.5), moveset(thundershock, tackle, bite, thunder)).
% jack_of_the_bridge
minster(19, mincario, steel, stats(14, 48, 48, 41, 29), powerup(2.7, 2.6, 1.7), moveset(aura_sphere, meteor_mash, vital_throw, bullet_punch)).
% redundant_jack_of_the_bridge
minster(20, mingearna, steel, stats(18, 62, 62, 57, 52), powerup(2.9, 2.9, 2.6), moveset(flash_canon, aura_sphere, magnet_bomb, thunderbolt)).
% big_fish
minster(21, wailminlord, water, stats(20, 104, 104, 47, 29), powerup(4.7, 2.1, 1.2), moveset(take_down, waterfall, hydro_pump, ice_beam)).
% researcher_cindi
minster(22, snormin, normal, stats(12, 64, 64, 35, 35), powerup(4.5, 2.5, 2.5), moveset(extreme_speed, pound, drain_punch, darkest_lariat)).
% researcher_chris
minster(23, mintrio, ground, stats(14, 38, 38, 37, 29), powerup(2, 2.3, 1.7), moveset(bulldoze, earthquake, magnet_bomb, sucker_punch)).
% researcher_allan
minster(24, sminda, normal, stats(16, 50, 50, 29, 29), powerup(2.5, 1.5, 1.5), moveset(take_down, feint, drain_punch, rock_smash)).
% researcher_jonathan
minster(25, hitmintop, fighting, stats(18, 51, 52, 45, 50), powerup(2.3, 2.2, 2.5), moveset(stomp, sucker_punch, double_kick, dynamic_punch)).
% researcher_eric
minster(26, mindoqueen, poison,  stats(20, 72, 72, 47, 45), powerup(3.1, 2.1, 2), moveset(stomp, ice_beam, earth_power, thunderbolt)).
% researcher_santa
minster(27, saminrott, water, stats(22, 81, 81, 60, 49), powerup(3.2, 2.5, 2), moveset(waterfall, secret_sword, ice_punch, hydro_pump)).
% ryan_lee
minster(28, mintwo, psychic, stats(24, 92, 92, 87, 56), powerup(3.4, 3.4, 2.1), moveset(psystrike, night_slash, psychic, aura_sphere)).
% monk_kant
minster(29, mindoking, poison, stats(13, 47, 47, 35, 28), powerup(2.9, 2.3, 1.8), moveset(earth_power, sludge_wave, thunder, blizzard)).
% monk_marx
minster(30, vespimin, bug, stats(14, 48, 48, 31, 37), powerup(2.7, 1.9, 2.3), moveset(signal_beam, scratch, aeroblast, sludge_bomb)).
% monk_locke
minster(31, minganium, grass, stats(16, 56, 56, 36, 42), powerup(2.9, 2, 2.3), moveset(grassy_glide, seed_bomb, petal_blizzard, earthquake)).
% monk_niet
minster(32, mr_min, psychic, stats(18, 48, 48, 47, 53), powerup(2.1, 2.3, 2.7), moveset(dream_eater, psychic, dark_pulse, aura_sphere)).
% platato
minster(33, alakamin, psychic, stats(22, 63, 63, 71, 54), powerup(2.4, 3, 2.2), moveset(psychic, extrasensory, dragon_pulse, bug_buzz)).
% shopkeep sanders
minster(34, blaminken, fire, stats(26, 85, 85, 75, 49), powerup(2.9, 2.7, 1.7), moveset(blaze_kick, dynamic_punch, aeroblast, fire_blast)).
% shopkeep ichiga
minster(35, mintagross, steel, stats(26, 85, 85, 82, 80), powerup(2.9, 3, 2.9), moveset(gear_grind, psystrike, earthquake, foul_play)).
% grandpa joe
minster(36, tyramintar, rock, stats(28, 103, 103, 88, 75), powerup(3.3, 3, 2.5), moveset(stone_edge, earthquake, bite, darkest_lariat)).
% flowerseller grace
minster(37, shaymin, grass, stats(28, 103, 103, 70, 70), powerup(3.3, 2.3, 2.3), moveset(aeroblast, petal_blizzard, bug_buzz, earth_power)).
% yourself
minster(38, salamince, dragon, stats(35, 122, 122, 110, 71), powerup(3.2, 3, 1.9), moveset(dragon_rush, aeroblast, earthquake, iron_tail)).

% wild
minster(40, charminder, fire, stats(1, 12, 12, 6, 6), powerup(2.1, 1.5, 1.3), moveset(tackle, ember, fly, fire_fang)).
minster(41, greminja, water, stats(1, 12, 12, 7, 6), powerup(2.7, 2.4, 1.7), moveset(aqua_jet, dark_pulse, water_shuriken, ice_beam)).
minster(42, abominsnow, grass, stats(1, 13, 13, 7, 7), powerup(3.1, 2.1, 2), moveset(razor_leaf, grassy_glide, blizzard, earthquake)).
minster(43, mingeotto, flying, stats(1, 12, 12, 6, 6), powerup(2.6, 1.5, 1.4), moveset(slash, air_slash, fly, u_turn)).
minster(44, minchamp, fighting, stats(1, 13, 13, 7, 7), powerup(3.1, 2.9, 2), moveset(brick_break, cross_chop, take_down, ice_punch)).
minster(45, sheminja, ghost, stats(1, 1, 1, 7, 8), powerup(0, 2.1, 1.2), moveset(shadow_claw, phantom_force, x_scissor, night_slash)).
minster(46, bulbamin, grass, stats(1, 12, 12, 6, 6), powerup(2.2, 1.6, 1.6), moveset(mega_drain, absorb, sludge_wave, sludge_bomb)).
minster(47, mindorina, poison, stats(1, 12, 12, 6, 6), powerup(2.7, 1.5, 1.6), moveset(tackle, poison_sting, poison_jab, mud_shot)).
minster(48, mintapod, bug, stats(1, 12, 12, 5, 6), powerup(2.3, 0.8, 1.4), moveset(tackle, splash, harden, bug_buzz)).
minster(49, chesmin, grass, stats(1, 12, 12, 6, 6), powerup(2.4, 1.5, 1.6), moveset(leafage, razor_leaf, needle_arm, circle_throw)).
minster(50, minplup, water, stats(1, 12, 12, 6, 6), powerup(2.4, 1.5, 1.4), moveset(peck, bubble_beam, water_gun, metal_claw)).
minster(51, minkey, normal, stats(1, 12, 12, 6, 6), powerup(2.1, 1.9, 1.2), moveset(scatch, tackle, circle_throw, rock_smash)).
minster(52, hitminlee, fighting, stats(1, 12, 12, 7, 7), powerup(2.3, 2.7, 2.5), moveset(karate_chop, circle_throw, sucker_punch, double_kick)).
minster(53, hitminchan, fighting, stats(1, 12, 12, 7, 7), powerup(2.3, 2.4, 2.5), moveset(dynamic_punch, fire_punch, ice_punch, thunder_punch)).
minster(54, minetric, electric, stats(1, 12, 12, 7, 6), powerup(2.7, 2.4, 1.5), moveset(thundershock, tackle, bite, thunder)).
minster(55, mincario, steel, stats(1, 12, 12, 7, 6), powerup(2.7, 2.6, 1.7), moveset(aura_sphere, meteor_mash, vital_throw, bullet_punch)).
minster(56, mingearna, steel, stats(1, 12, 12, 7, 7), powerup(2.9, 2.9, 2.6), moveset(flash_canon, aura_sphere, magnet_bomb, thunderbolt)).
minster(57, wailminlord, water, stats(1, 14, 14, 7, 6), powerup(4.7, 2.1, 1.2), moveset(take_down, waterfall, hydro_pump, ice_beam)).
minster(58, snormin, normal, stats(1, 14, 14, 7, 7), powerup(4.5, 2.5, 2.5), moveset(extreme_speed, pound, drain_punch, darkest_lariat)).
minster(59, mintrio, ground, stats(1, 12, 12, 7, 6), powerup(2, 2.3, 1.7), moveset(bulldoze, earthquake, magnet_bomb, sucker_punch)).
minster(60, sminda, normal, stats(1, 12, 12, 6, 6), powerup(2.5, 1.5, 1.5), moveset(take_down, feint, drain_punch, rock_smash)).
minster(61, hitmintop, fighting, stats(1, 12, 12, 7, 7), powerup(2.3, 2.2, 2.5), moveset(stomp, sucker_punch, double_kick, dynamic_punch)).
minster(62, mindoqueen, poison,  stats(1, 13, 13, 7, 7), powerup(3.1, 2.1, 2), moveset(stomp, ice_beam, earth_power, thunderbolt)).
minster(63, saminrott, water, stats(1, 13, 13, 7, 7), powerup(3.2, 2.5, 2), moveset(waterfall, secret_sword, ice_punch, hydro_pump)).
minster(64, mintwo, psychic, stats(1, 13, 13, 8, 7), powerup(3.4, 3.4, 2.1), moveset(psystrike, night_slash, psychic, aura_sphere)).
minster(65, mindoking, poison, stats(1, 12, 12, 7, 6), powerup(2.9, 2.3, 1.8), moveset(earth_power, sludge_wave, thunder, blizzard)).
minster(66, vespimin, bug, stats(1, 12, 12, 6, 7), powerup(2.7, 1.9, 2.3), moveset(signal_beam, scratch, aeroblast, sludge_bomb)).
minster(67, minganium, grass, stats(1, 12, 12, 6, 7), powerup(2.9, 2, 2.3), moveset(grassy_glide, seed_bomb, petal_blizzard, earthquake)).
minster(68, mr_min, psychic, stats(1, 12, 12, 7, 7), powerup(2.1, 2.3, 2.7), moveset(dream_eater, psychic, dark_pulse, aura_sphere)).
minster(69, alakamin, psychic, stats(1, 12, 12, 8, 7), powerup(2.4, 3, 2.2), moveset(psychic, extrasensory, dragon_pulse, bug_buzz)).
minster(70, blaminken, fire, stats(1, 12, 12, 7, 6), powerup(2.9, 2.7, 1.7), moveset(blaze_kick, dynamic_punch, aeroblast, fire_blast)).
minster(71, mintagross, steel, stats(1, 12, 12, 7, 7), powerup(2.9, 3, 2.9), moveset(gear_grind, psystrike, earthquake, foul_play)).
minster(72, tyramintar, rock, stats(1, 13, 13, 7, 7), powerup(3.3, 3, 2.5), moveset(stone_edge, earthquake, bite, darkest_lariat)).
minster(73, shaymin, grass, stats(1, 13, 13, 7, 7), powerup(3.3, 2.3, 2.3), moveset(aeroblast, petal_blizzard, bug_buzz, earth_power)).
minster(74, salamince, dragon, stats(1, 13, 13, 8, 8), powerup(3.2, 3, 1.9), moveset(dragon_rush, aeroblast, earthquake, iron_tail)).
minster(75, mintine, water, stats(1, 13, 13, 6, 8), powerup(3, 1.9, 3.1), moveset(water_gun, water_pulse, acid_spray, air_cutter)).
minster(76, mingull, flying, stats(1, 12, 12, 6, 5), powerup(2.1, 1.4, 0.9), moveset(water_gun, steel_wing, wing_attack, u_turn)).
minster(77, mincada, bug, stats(1, 11, 11, 6, 7), powerup(1.9, 1.2, 2.1), moveset(tackle, struggle, bug_bite, fury_cutter)).
minster(78, minjask, bug, stats(1, 12, 12, 7, 6), powerup(2.5, 2.1, 1.3), moveset(fury_cutter, bug_buzz, signal_beam, rock_tomb)).
minster(79, minotic, water, stats(1, 13, 13, 7, 7), powerup(3.2, 2.3, 2.8), moveset(water_pulse, ice_beam, liquidation, dragon_pulse)).
minster(80, totomin, water, stats(1, 12, 12, 6, 6), powerup(2.3, 1.6, 1.6), moveset(water_gun, bite, pound, rock_throw)).
minster(81, minferno, fire, stats(1, 12, 12, 6, 6), powerup(2.6, 1.9, 1.3), moveset(vacuum_wave, fire_fang, mach_punch, take_down)).
minster(82, minfernape, fire, stats(1, 12, 12, 6, 6), powerup(2.8, 2.4, 1.7), moveset(vacuum_wave, earthquake, iron_head, fire_blast)).
minster(83, minpoleon, water, stats(1, 12, 12, 7, 7), powerup(3, 2.5, 2.3), moveset(hydro_pump, earthquake, gear_grind, ice_beam)).
minster(84, mincineroar, fire, stats(1, 13, 13, 7, 7), powerup(3.2, 2.6, 2.1), moveset(flamethrower, darkest_lariat, blaze_kick, sky_uppercut)).
minster(85, minteleon, water, stats(1, 12, 12, 7, 6), powerup(2.7, 2.8, 1.6), moveset(hydro_pump, ice_beam, air_slash, liquidation)).
minster(86, quillamin, grass, stats(1, 12, 12, 6, 7), powerup(2.5, 1.9, 2.2), moveset(lava_plume, flamethrower, take_down, bite)).
minster(87, mindoran, poison, stats(1, 12, 12, 6, 6), powerup(2.4, 1.4, 1.3), moveset(tackle, poison_jab, earth_power, energy_ball)).
minster(88, mindorino, poison, stats(1, 12, 12, 6, 6), powerup(2.5, 1.7, 1.4), moveset(tackle, sludge_wave, earth_power, leech_life)).
minster(89, starmin, water, stats(1, 12, 12, 7, 7), powerup(2.5, 2.3, 2), moveset(waterfall, hydro_pump, psychic, psystrike)).
minster(90, ominyte, water, stats(1, 12, 12, 7, 7), powerup(2, 2.1, 2.3), moveset(take_down, waterfall, energy_ball, power_gem)).
/**Type Modifier:
 * 4: super effective
 * 2: neutral
 * 1: not very effective
 * 0: immunity
 */

gettypemodifier(AttackType, DefenseType, Modifier) :-
    typefactor(AttackType, DefenseType, 0),
    Modifier is 0,
    write('It had no effect.'), nl.

gettypemodifier(AttackType, DefenseType, Modifier) :-
    typefactor(AttackType, DefenseType, 1),
    Modifier is 1,
    write('It was not effective.'), nl.

gettypemodifier(AttackType, DefenseType, Modifier) :-
    typefactor(AttackType, DefenseType, 2),
    Modifier is 2.

gettypemodifier(AttackType, DefenseType, Modifier) :-
    typefactor(AttackType, DefenseType, 4),
    Modifier is 4,
    write('It was super effective.'), nl.

typefactor(normal, normal, 2).
typefactor(normal, fire, 2).
typefactor(normal, water, 2).
typefactor(normal, electric, 2).
typefactor(normal, grass, 2).
typefactor(normal, ice, 2).
typefactor(normal, fighting, 2).
typefactor(normal, poison, 2).
typefactor(normal, ground, 2).
typefactor(normal, flying, 2).
typefactor(normal, psychic, 2).
typefactor(normal, bug, 2).
typefactor(normal, rock, 1).
typefactor(normal, ghost, 0).
typefactor(normal, dragon, 2).
typefactor(normal, dark, 2).
typefactor(normal, steel, 1).
typefactor(fire, normal, 2).
typefactor(fire, fire, 1).
typefactor(fire, water, 1).
typefactor(fire, electric, 2).
typefactor(fire, grass, 4).
typefactor(fire, ice, 4).
typefactor(fire, fighting, 2).
typefactor(fire, poison, 2).
typefactor(fire, ground, 2).
typefactor(fire, flying, 2).
typefactor(fire, psychic, 2).
typefactor(fire, bug, 4).
typefactor(fire, rock, 1).
typefactor(fire, ghost, 2).
typefactor(fire, dragon, 1).
typefactor(fire, dark, 2).
typefactor(fire, steel, 4).
typefactor(water, normal, 2).
typefactor(water, fire, 4).
typefactor(water, water, 1).
typefactor(water, electric, 2).
typefactor(water, grass, 1).
typefactor(water, ice, 2).
typefactor(water, fighting, 2).
typefactor(water, poison, 2).
typefactor(water, ground, 4).
typefactor(water, flying, 2).
typefactor(water, psychic, 2).
typefactor(water, bug, 2).
typefactor(water, rock, 4).
typefactor(water, ghost, 2).
typefactor(water, dragon, 1).
typefactor(water, dark, 2).
typefactor(water, steel, 2).
typefactor(electric, normal, 2).
typefactor(electric, fire, 2).
typefactor(electric, water, 4).
typefactor(electric, electric, 1).
typefactor(electric, grass, 1).
typefactor(electric, ice, 2).
typefactor(electric, fighting, 2).
typefactor(electric, poison, 2).
typefactor(electric, ground, 0).
typefactor(electric, flying, 4).
typefactor(electric, psychic, 2).
typefactor(electric, bug, 2).
typefactor(electric, rock, 2).
typefactor(electric, ghost, 2).
typefactor(electric, dragon, 1).
typefactor(electric, dark, 2).
typefactor(electric, steel, 2).
typefactor(grass, normal, 2).
typefactor(grass, fire, 1).
typefactor(grass, water, 4).
typefactor(grass, electric, 2).
typefactor(grass, grass, 1).
typefactor(grass, ice, 2).
typefactor(grass, fighting, 2).
typefactor(grass, poison, 1).
typefactor(grass, ground, 4).
typefactor(grass, flying, 1).
typefactor(grass, psychic, 2).
typefactor(grass, bug, 1).
typefactor(grass, rock, 4).
typefactor(grass, dragon, 1).
typefactor(grass, dark, 2).
typefactor(grass, steel, 1).
typefactor(ice, normal, 2).
typefactor(ice, fire, 1).
typefactor(ice, water, 1).
typefactor(ice, electric, 2).
typefactor(ice, grass, 4).
typefactor(ice, ice, 1).
typefactor(ice, fighting, 2).
typefactor(ice, poison, 2).
typefactor(ice, ground, 4).
typefactor(ice, flying, 4).
typefactor(ice, psychic, 2).
typefactor(ice, bug, 2).
typefactor(ice, rock, 2).
typefactor(ice, ghost, 2).
typefactor(ice, dragon, 4).
typefactor(ice, dark, 2).
typefactor(ice, steel, 1).
typefactor(fighting, normal, 4).
typefactor(fighting, fire, 2).
typefactor(fighting, water, 2).
typefactor(fighting, electric, 2).
typefactor(fighting, grass, 2).
typefactor(fighting, ice, 4).
typefactor(fighting, fighting, 2).
typefactor(fighting, poison, 1).
typefactor(fighting, ground, 2).
typefactor(fighting, flying, 1).
typefactor(fighting, psychic, 1).
typefactor(fighting, bug, 1).
typefactor(fighting, rock, 4).
typefactor(fighting, ghost, 0).
typefactor(fighting, dragon, 2).
typefactor(fighting, dark, 4).
typefactor(fighting, steel, 4).
typefactor(poison, normal, 2).
typefactor(poison, fire, 2).
typefactor(poison, water, 2).
typefactor(poison, electric, 2).
typefactor(poison, grass, 4).
typefactor(poison, ice, 2).
typefactor(poison, fighting, 2).
typefactor(poison, poison, 1).
typefactor(poison, ground, 1).
typefactor(poison, flying, 2).
typefactor(poison, psychic, 2).
typefactor(poison, bug, 2).
typefactor(poison, rock, 1).
typefactor(poison, ghost, 1).
typefactor(poison, dragon, 2).
typefactor(poison, dark, 2).
typefactor(poison, steel, 0).
typefactor(ground, normal, 2).
typefactor(ground, fire, 4).
typefactor(ground, water, 2).
typefactor(ground, electric, 4).
typefactor(ground, grass, 1).
typefactor(ground, ice, 2).
typefactor(ground, fighting, 2).
typefactor(ground, poison, 4).
typefactor(ground, ground, 2).
typefactor(ground, flying, 0).
typefactor(ground, psychic, 2).
typefactor(ground, bug, 1).
typefactor(ground, rock, 4).
typefactor(ground, ghost, 2).
typefactor(ground, dragon, 2).
typefactor(ground, dark, 2).
typefactor(ground, steel, 4).
typefactor(flying, normal, 2).
typefactor(flying, fire, 2).
typefactor(flying, water, 2).
typefactor(flying, electric, 1).
typefactor(flying, grass, 4).
typefactor(flying, ice, 2).
typefactor(flying, fighting, 4).
typefactor(flying, poison, 2).
typefactor(flying, ground, 2).
typefactor(flying, flying, 2).
typefactor(flying, psychic, 2).
typefactor(flying, bug, 4).
typefactor(flying, rock, 1).
typefactor(flying, ghost, 2).
typefactor(flying, dragon, 2).
typefactor(flying, dark, 2).
typefactor(flying, steel, 1).
typefactor(psychic, normal, 2).
typefactor(psychic, fire, 2).
typefactor(psychic, water, 2).
typefactor(psychic, electric, 2).
typefactor(psychic, grass, 2).
typefactor(psychic, ice, 2).
typefactor(psychic, fighting, 4).
typefactor(psychic, poison, 4).
typefactor(psychic, ground, 2).
typefactor(psychic, flying, 2).
typefactor(psychic, psychic, 1).
typefactor(psychic, bug, 2).
typefactor(psychic, rock, 2).
typefactor(psychic, ghost, 2).
typefactor(psychic, dragon, 2).
typefactor(psychic, dark, 0).
typefactor(psychic, steel, 1).
typefactor(bug, normal, 2).
typefactor(bug, fire, 1).
typefactor(bug, water, 2).
typefactor(bug, electric, 2).
typefactor(bug, grass, 4).
typefactor(bug, ice, 2).
typefactor(bug, fighting, 1).
typefactor(bug, poison, 1).
typefactor(bug, ground, 2).
typefactor(bug, flying, 1).
typefactor(bug, psychic, 1).
typefactor(bug, bug, 2).
typefactor(bug, rock, 2).
typefactor(bug, ghost, 1).
typefactor(bug, dragon, 2).
typefactor(bug, dark, 4).
typefactor(bug, steel, 1).
typefactor(rock, normal, 2).
typefactor(rock, fire, 4).
typefactor(rock, water, 2).
typefactor(rock, electric, 2).
typefactor(rock, grass, 2).
typefactor(rock, ice, 4).
typefactor(rock, fighting, 1).
typefactor(rock, poison, 2).
typefactor(rock, ground, 1).
typefactor(rock, flying, 4).
typefactor(rock, bug, 4).
typefactor(rock, rock, 2).
typefactor(rock, ghost, 2).
typefactor(rock, dragon, 2).
typefactor(rock, dark, 2).
typefactor(rock, steel, 1).
typefactor(ghost, normal, 0).
typefactor(ghost, fire, 2).
typefactor(ghost, water, 2).
typefactor(ghost, electric, 2).
typefactor(ghost, grass, 2).
typefactor(ghost, ice, 2).
typefactor(ghost, fighting, 2).
typefactor(ghost, poison, 2).
typefactor(ghost, ground, 2).
typefactor(ghost, flying, 2).
typefactor(ghost, psychic, 4).
typefactor(ghost, bug, 2).
typefactor(ghost, rock, 2).
typefactor(ghost, ghost, 4).
typefactor(ghost, dragon, 2).
typefactor(ghost, dark, 1).
typefactor(ghost, steel, 2).
typefactor(dragon, normal, 2).
typefactor(dragon, fire, 2).
typefactor(dragon, water, 2).
typefactor(dragon, electric, 2).
typefactor(dragon, grass, 2).
typefactor(dragon, ice, 2).
typefactor(dragon, fighting, 2).
typefactor(dragon, poison, 2).
typefactor(dragon, ground, 2).
typefactor(dragon, flying, 2).
typefactor(dragon, psychic, 2).
typefactor(dragon, bug, 2).
typefactor(dragon, rock, 2).
typefactor(dragon, ghost, 2).
typefactor(dragon, dragon, 4).
typefactor(dragon, dark, 2).
typefactor(dragon, steel, 1).
typefactor(dark, normal, 2).
typefactor(dark, fire, 2).
typefactor(dark, water, 2).
typefactor(dark, electric, 2).
typefactor(dark, grass, 2).
typefactor(dark, ice, 2).
typefactor(dark, fighting, 1).
typefactor(dark, poison, 2).
typefactor(dark, ground, 2).
typefactor(dark, flying, 2).
typefactor(dark, psychic, 4).
typefactor(dark, bug, 2).
typefactor(dark, rock, 2).
typefactor(dark, ghost, 4).
typefactor(dark, dragon, 2).
typefactor(dark, dark, 1).
typefactor(dark, steel, 2).
typefactor(steel, normal, 2).
typefactor(steel, fire, 1).
typefactor(steel, water, 1).
typefactor(steel, electric, 1).
typefactor(steel, grass, 2).
typefactor(steel, ice, 4).
typefactor(steel, fighting, 2).
typefactor(steel, poison, 2).
typefactor(steel, ground, 2).
typefactor(steel, flying, 2).
typefactor(steel, psychic, 2).
typefactor(steel, bug, 2).
typefactor(steel, rock, 4).
typefactor(steel, ghost, 2).
typefactor(steel, dragon, 2).
typefactor(steel, dark, 2).
typefactor(steel, steel, 1).