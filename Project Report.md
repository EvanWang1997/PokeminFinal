Pokemin is a story-focused interactive adventure about a boy named Min who sets off an adventure to become the very best. It's an extremely abstract reason to leave home at the age of 12 to be honest...his parents wanted him to be a doctor.
- Branching storylines, with the user entering natural language to select choices along the way
- Access and update resources available to Min as he goes along his adventure
- Access save states, with Min's previous location and status

Below is an overview of different areas of things to be made:
1. Trainers:
   - Contains a name associated with each trainer
   - Associated with an id, mapping each id to a unique mon with stats and levels
   - A list of static trainers can be kept in the base,
     and encountered based on which route is taken
2. Mons:
   - Each mon should be associated with an ID, name, and type
   - An instance of a mon should be based on an original template
     with all of its associated base stats
   - Stats should scale with level
   - Each mon should have the following stat fields:
       - Max hp
       - Attack
       - Defense
   - There should be 4 moves associated with each mon
3. Moves:
   - Each move should have a type
   - Each move should have a base atk, which will directly feed
     into calculations for damage
4. Story:
   - Can model entire map as an interconnected database
   - Can be a relatively short maze like place
   - Navigating to locations will result in encounters with trainers
   - Elite something, idk, could happen at the end
 
Modules and Directories:
By the end of the project, the following modules were created and maintained in order to be accessible to the main file, while storing and allowing access to categories of facts, predicates, and clauses:

**Images:** Contained visual representations for the world built in the program, acted as a guide for designing our areas and connections

**Map Connections:** Folder with files for prototyping the original world design, before individual areas were consolidated into a final zone nfl

**Music:** We had attempted to launch a separate shell to manage and play music at different points in the story. We did not get that far.

**Story Zones Overview:** Contains text overviews for the story, later imported into specific event dialogue

**Areas.pl:** Maintains facts and predicates pertaining to how the world is represented, as well as connections between areas within the world itself

**Battle.pl:** Contains predicates and calls for running a battle system given two trainer identification, and then enters into a loop until one trainer is defeated. Also contains damage calculations, post battle messages, and manages the state of the battle at any given moment. Once a battle is completed, it will automatically return to whatever called the battle

**Eventhandler.pl:** Contains data and calls that manage how events are identified, triggered, and handled. In addition, this file contains a list of all possible events that can be triggered. Other files have access to this module, which allows them to trigger events if the character has reached a state in the game.

**List of trainers.txt** Contains a list of trainers ids that are used as identifiers for their stats later on in the story, organized by level of difficulty

**Main.pl:** Contains the main predicates and calls used to access the entire Pokemin program. Houses  primary menus for accessing actions such as movement, team management, and wild encounters at any given moment. The program ends once the story is finished.

**Maincharacter.pl:** Contains facts related to the main character’s state at any given moment in the story, which can be adjusted in the battle or main module. File includes things such as whether the main character has fainted, as well his position in the world, and how he is allowed to move into new areas.

**Minsters.pl:** Contains a list of monsters, which makes up the team composition for both the main character as well his opponents throughout the story. Contains information such as their stats, levels, as well as implements how their stats can change as a result of battles.

**Moves.pl:** Contains a list of moves, along with their stats that can be given to the movebase for different monsters. In battle, the system will identify a monster, and then access the move using the move’s name.

**Overworld.pl:** Contains information regarding how the larger areas are connected to one another

**Startevents.pl**: Contains a startevent to be run before the main loop in the story, prompts the user to select their first area to go to, as well as provides an overview of the world

**Textmanager.pl**: Contains predicates that allow easier writing of dialogue and lines within the story, primarily used by event handler to create event dialogue

**Trainer Balancing.txt**: Contains information regarding how each opponent in the story should be set in level

**Trainers.pl:** Contains predicates that allow access to a specific opponent’s monster, as well as a list of facts specifying the names of actual trainers, accessible by eventhandler so it can initiate battle with these opponents at different points in the story

Playing the Game:
The game is a story-focused rpg throughout which the player is asked to choose from a list of possible decisions. Some areas are designed as mazes and so the game would ideally be played blindly, but if the player chooses, they can access the maps of each area in the Maps folder.
At each spot in an area, the game displays the player’s position and 3 possible actions: move to a different spot, switch the battling monster in their party, or engage in a wild encounter.

**Moving between areas:** Each area has a number of spots the player can access. Some of them are associated with events(piece of story, battles, dialogue, etc.). Events can only be completed once; after an event completes, the player can return to that area normally if needed. By choosing the move option, the game lists the possible spots the player can move to. To move to a different spot, the player has to input the exact name of the spot. On a successful move, the game will display the player’s position and a new list of possible actions.

**Switching Minsters:** The player has six monsters in their party. The monster in first position is the one used during a battle. Switching can only be done in between battles. By choosing the switch option, the game will display all 6 monsters, along with their levels, stats, and moveset. To choose a monster, the player has to input the corresponding index of the monster.

**Wild Encounters:** A wild encounter can happen at any point in between events. The wild encounter is guaranteed to be at a lower level than the player(but not necessarily easy!). Upon triggering the encounter, the player enters the battle sequence with the wild monster.

**Battle:** A battle is a turn-based sequence of action during which the player can choose what move to execute. The names and levels of both monsters will be displayed. Only the moveset of your monster will be displayed at the bottom including attack typing. Keep type advantage in mind and carefully choose your move to win the battle.


What did we learn from doing this:
- Abstraction of a relatively complex world and elements into a set of facts that represent the world simply, as well as a set of predicates that can generally manipulate those facts
- Iteratively adjusting our program as it grew so that the accessible facts were limited to what we strictly needed, and refactored with less redundancy or potential redundant access in mind
- Defined and maintained clear relationships between elements, such as how areas were connected, as well as trainers and their pokemon were maintained in a simple database

- Overall, logic programming was especially useful in quickly creating a large set of facts to manipulate, without some of the hassle that comes with needing to define new classes that may or may not be used down the line. This quick “prototyping” of relationships within our knowledge base allowed us to test how we might want to represent the overall system. 
