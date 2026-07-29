Sí, señor
Keep yourself safe

# Carmilla's Manor
 > Carmilla's Manor is a horror RPG that follows the story of Lauren. This heroine must traverse through a perilous manor to please the whims of her parents and retrieve an artifact that belonged to her family. Unbeknownst to her, the antagonistic figure Carmilla lurks the manor's halls. As Lore unravels, Lauren realizes how twisted Carmilla's mind has become. Carmilla believes that Lauren is the woman she had fallen in love with years ago. As her mind shatters she clings to Lauren as a beacon to her fractured life. Lauren must evade Carmilla's attacks, retrieve the relic, and escape the manor alive.

# Challenges

- Scale
	- The biggest challenge in the code was learning how to use Godot for the first time, all while keeping pace with the ambitious scale of the game. Existing game nodes within *Carmilla's Manor* consisted of Characters, Rooms, Cutscenes, Interactable Items, Dialogue, Keys, and Door Puzzles. Additionally, the different states of each of these nodes needed to kept track of (e.g. the 2nd floor library might be locked or unlocked, which would affect whether or not the staircase might teleport the character to the regular grand hall or the altered grand hall).  
- Loading Persistent Data: 
	- Another, more interesting exercise this game provided was dealing with persistent levels. An autoloader implemented as a singleton was necessary to efficiently load a scene during door/scene teleports, all while keeping data persistent. 
- State Management
	- As an extremely rudimentary finite-state-machine (FSM) approach, duplicates of rooms and characters were created and switched to; this would allow for quick state-switching. Since this approach is non-ideal, this will be replaced in future with a true FSM Godot implementation.
