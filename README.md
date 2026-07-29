Sí, señor
Keep yourself safe

Welcome to our gallery viewers! :D

# Carmilla's Manor (from out itch.io page synopsis)
 > Carmilla's Manor is a horror RPG that follows the story of Lauren. This heroine must traverse through a perilous manor to please the whims of her parents and retrieve an artifact that belonged to her family. Unbeknownst to her, the antagonistic figure Carmilla lurks the manor's halls. As Lore unravels, Lauren realizes how twisted Carmilla's mind has become. Carmilla believes that Lauren is the woman she had fallen in love with years ago. As her mind shatters she clings to Lauren as a beacon to her fractured life. Lauren must evade Carmilla's attacks, retrieve the relic, and escape the manor alive.

# Challenges

- Scale
	- The biggest challenge in the code was learning how to use Godot for the first time, all while keeping pace with the ambitious scale of the game. Existing game nodes within *Carmilla's Manor* consisted of Characters, Rooms, Cutscenes, Interactable Items, Dialogue, Keys, and Door Puzzles. Additionally, the different states of each of these nodes needed to kept track of (e.g. the 2nd floor library might be locked or unlocked, which would affect whether or not the staircase might teleport the character to the regular grand hall or the altered grand hall).  
- Loading Persistent Data: 
	- Another, more interesting exercise this game provided was dealing with persistent levels. An autoloader implemented as a singleton was necessary to efficiently load a scene during door/scene teleports, all while keeping data persistent. 
- State Management
	- As an extremely rudimentary finite-state-machine (FSM) approach, duplicates of rooms and characters were created and switched to; this would allow for quick state-switching. Since this approach is non-ideal, this will be replaced in future with a true FSM Godot implementation.

# Initial Implementations
- As an initial solution to the difficult scale of the game, a "Puzzles" class implementation was considered, which would encompass Puzzle objects. A single Puzzle would then consist of needing specific "puzzle piece" objects in order to solve it. For instance, to solve the library door puzzle, you would need to have collected all the necessary keys and interacted with the right items before the door can be unlocked. This could make Godot development easier, since these puzzle pieces could be implemented as exported variables, meaning nodes can simply be selected in the Inspect dock. In theory, this could have streamlined development; however, the implementation of the class itself turned more costly on time, and was thus abandoned in favour of the simpler, but less elegant solution of adding lots and lots of if-statements. In future, perhaps this class will be refined and reconsidered.

# Future Dev Hopes and Dreams
- Make it distributable for MacOS
- Add UI, and inventory, a proper level reset when the health bar depletes
- Finite state machine to manage room states, character states
- A much more animated cutscene experience
