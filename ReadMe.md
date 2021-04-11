# Pokemin Design Overview

## Usage
```prolog```

## Overview
Pokemin is an interactive rpg, inspired by a simplified version
of another popular RPG

## TODOs and Plan
(Please keep in mind that the plan can be fluid, and adjusted
to be more static based on time available)

Below is an overview of different areas of things to be made:
1. Trainers:
    - Contains a name and an id associated with each trainer
    - Associated with a group of 6 different ids, mapping
      each id to a unique mon with stats and levels
    - Maybe a list of items, if we have the time
    - A list of static trainers can be kept in the base,
      and encountered based on which route is taken
2. Mons:
    - Each mon should be associated with an ID, name, and type (if)
    - An instance of a mon should be based on an original template
      with all of its associated base stats
    - Stats should scale with level (if level is implemented)
    - Each mon should have the following stat fields:
        - Max hp
        - Atk
        - Defence
        - Speed (maybe, could just be a coin flip)
    - There should be 4 moves associated with each mon
3. Moves:
    - Each move should have a type
    - Each move should have a base atk, which will directly feed
      into calculations for damage
4. Story:
    - Can model entire map as an interconnected database
    - Can be a relatively short maze like place
    - Navigating to locations will result in encounters with trainers (and maybe new mons)
    - Elite something, idk, could happen at the end


