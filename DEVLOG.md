# DEVLOG

*Ge-Mu: Null*  
*Start Date: March 18, 2026*  
*End Date: ---*  

## Introduction

Hello, this is Christian! This file is similar to a diary that I usually keep around, and will serve as a learning hub for those who are interested. You will information on how and why I developed this game, and what are the reasons behind developing certain codes. The project overview can be found on the `README.md`. Without further ado, let's get to it!

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
