# DEVLOG

*Ge-Mu: Null*  
*Start Date: March 18, 2026*  
*End Date: ---*  

## Introduction

Hello, this is Christian! This file is similar to a diary that I usually keep around, and will serve as a learning hub for those who are interested. You will information on how and why I developed this game, and what are the reasons behind developing certain codes. The project overview can be found on the `README.md`. Without further ado, let's get to it!

## DAY 03 | The Skills [March 21, 2026]

### The Dash

The game will act like an Role-Playing Game (RPG), and with that, I would like to set creative challenges for the player to handle. I developed **only 1 skill** for this prototype to test the mechanics out. The Dash skill. We all know it, so I don't really need to get into much detail about it. Basically, it's tied to one of the Memory Cells, similar to NPCs. Furthermore, when a cell gets corrupted, the skills vanish, and player won't be able to use it. It gives more **importance** to the Memory Cell, forcing the player to watch over it.

### How I did It

Well, since this is a material for learning, I guess I still have to tell how I did the Dash Skill. Basically, it just increase speed dramatically for a short period of time.

In the tecnical side, the `Player.gd` has a variable called `velocity`, which controls how fast and where the player is going. It is inside a function called `_handle_movement()` that checks first if the player `is_dashing`. If it is true, then the script will opt to using the `DASH_SPEED`, with the value of `400.0`. And if it is false, then the script will use the default `SPEED`, which is `120.0`.

There's, of course, a timer for it. When the timer expires, it sets `is_dashing` to false, and tells the script to flip back to the default `SPEED`. It's really that simple. Additionally, I added a little visual feedback to be able to tell when the character is dashing. Just changing the color of the character's body is enough.

### The Direction of the Project

Ge-Mu: Null may take different forms in the future, but mainly it will be an RPG. With this much features, my brain has been thinking of different mechanics for the game! XD. But, before anything else, **the prototype must be finished first**. All the features right now are just out of context. To simply put it, they are just for testing purposes. NPCs are randomly placed, the skills are not useful. All of this will be just used for making the **core gameplay** work.

## DAY 02 | The NPCs [March 20, 2026]

### The Non-Playable Characters

First of all, this is still *experimental*. There is no asset nor proper dialogue for the NPCs. Right now, the goal is to develop the mechanic to see whether this game will work out or not. Currently, there are 2 NPCs; namely **Chano, and Polaris**. They are just names I came up with on the spot, and their sprites are just squares with solid color (amber) to distinguish between player and NPCs.

### What is the Goal?

The goal here to tie them up with the Memory Cells, so each NPC's should have at least **1 cell**. If that cell gets corrupted, they will vanish, **forever**. The key here is to assign each NPC, what cells they are. I exposed the variable for configuration to set the cell index and use it to reference with the `MemoryManager.gd` to counter check which cell has been corrupted.

### How does it Work?

Since all NPCs, have a cell index, we counter check it using signals from the `MemoryManager.gd`. Everytime a cell gets corrupted, the `MemoryManager.gd` will fire a **fire** a signal saying *"Hey, cell N just get corrupted!"*, then the `NPC.gd`, which is the script for the NPCs, listens to that signal and match the cell index to the NPC's cell index. If it matched, the NPC will vanish and be removed from the scene.

I did it this way to learn more about **Human Emotion**. As I have stated in my goals for this project, I plan to learn more about Human Interaction. Using this chance to try things out with the question of *"How will the user react if I did this?"* or *"What will the user do when presented by this?"* Starting with the NPCs, I plan to develop NPCs that will connect with the user and see what they are in a situation, or when they to take action.

### Today's Work

Today, the development of the NPCs core mechanics is successful, although the *emotion* is not yet there since they are not polished yet. I believe that I can test things out when the assets are ready! Well, see yah again soon!

## DAY 01 | The Start of a Long Journey [March 18, 2026]

### Hello, World

Today, I created repository in my GitHub to remotely store my project, just in case some unexpected events happens. While doing this, I also initiated the project in Godot!

### Why Godot?

Out of all the Game Engines out there, why Godot? To be frank, it was the best option that I had right now. I do have background knowledge with Unity, and could have learned Unreal Engine for a future-ready career... I instead opted for Godot since I already made lots of games with it, and it is the best when it comes with 2D games. That's pretty much it! I already made games before by building my own game engine (Java and Python), I prefer it this way. It's not like using a Game Engine degrades a game developer. It is the **fun** that matters, as long as players enjoy your games, that's enough.

### What I did today

All I did was developing the first core mechanic of the game. Since the theme of this game is `Memory Leak`, I remembered myself XD. Thoughts and ideas quickly slip away my brain, that's why I write this kind of things, to help me remember. Anyway, the story of the game will be like this:

You're a programmer that was diagnosed with **early-onset amnesia** who discovers that your consciousness has been *secretly* uploaded to an old, deteriorating computer system. The cruel part, the computer has a memory leak. The world around you corrupts, disappears, and glitches... just like you real memories did. Now you have to make a choice, to save this world or to return to yours. Remember: all actions has consequences.

And that's pretty much the story behind it. I simply developed a Memory Grid. There are 3 parts of it:

- Memory Cell
- Memory Grid
- Memory Manager

To put it simply,  

The **Memory Manager** is the one responsible for overseeing the Memory Grid, and allocates Memory Cell of different types into it.  
The **Memory Grid** holds the Memory Cell in an 8x8 grid. Why 8x8? I would like tie it up with tech. 1 byte = 8 bits. The number 8 is a common thing in computer science, you probably wanna look into, it has something that gotta do with binaries and stuff.  
The **Memory Cell** is the *currency* of this world, you need to unlock NPCs, skills, and places. It get's corrupted and depletes over time. When it goes to 0, the character gets corrupted or forgets everything.

### The Mechanic

The Memory cell leaks every 60 seconds leading to corruption. It might change in the future, but that's that for now. I set the MemoryManager to autoload, since most of the modules will use it in the future. All the visual stuffs are temporary for now. The Memory Cell can't do much in this version, but that ends for today's goal.

### The Goal

The goal of developing this project is mostly for educational purposes. Just to enhance my Game Development skills, and use this chance to explore other fields, like arts, musics, and human interaction. The human interaction part is much more important, it will help me be able to design things with intent and context much more better, if I understand human emotions more.
