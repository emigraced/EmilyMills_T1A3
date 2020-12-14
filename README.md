# The Sims: Command Line Edition

Github Repository: https://github.com/emigraced/EmilyMills_T1A3
*Note, this repo is private. Varsha & Jairo have been added as collaborators.*

## Software Development Plan (SDP)

### Purpose/Scope Statement

The purpose of this app is to bring a sense of nostalgia to the user by providing a limited selection of features from the popular 'The Sims' franchise. (It will be targetted towards those who are familiar with the game.)

The original franchise is a simulation game where users can create heavily customisable people ('Sims') and control their lives, including their moods, aspirations, relationships, living situations, and much more. 

With the use of the TTY-Prompt Gem, this Ruby terminal app will allow users to create multiple Sims and specify their name, gender, stage of life, and a trait. The user can choose a Sim to 'play', and direct them to have certain interactions with other Sims. The key interest of the game is that the outcomes to these interactions will have different probabilities depending on the selected trait (friendly or mean) of the Sim in play. 

To further drive home the nostalgia, the app makes use of a few specific elements which nod to the original game: 
- the colour green (one of the logo colours)
- a diamond selector in the TTY prompt menus (reminiscent of the plumbob)
- a diamond TTY spinner (reminiscent of the loading screens)

This app reads and writes to a YAML database, which enables the game to be saved. When the user runs the app, their previously created Sims will be available to them. They will also have the option to wipe the database if they would like to start afresh. 

An instruction book is also made easily available within the app if the user requires guidance. 

### Features

#### Create Sims (unlimited)

#### Sim Interaction (with probability)

#### Save Game (autosave)

### User Interaction/Experience

Upon running the app, immediately available to the user is the option to read the instructions, which display neatly formatted as a markdown file within the terminal. 

The program also utilises TTY prompt to significantly limit the capacity for error by ensuring the user cannot enter an invalid response. 

### Diagram 



### Implementation Plan 

My implementation plan can be found on my [Trello board](https://trello.com/b/TUebzU4P/term-1-terminal-project)


### Help Documentation

Instructions

#### steps to install the application


#### any dependencies required by the application to operate


#### any system/hardware requirements







#### Attribution 
- The Sims Video Games from Electronic Arts
https://www.ea.com/en-au/games/the-sims
- Terminal Apps the Easy Way  
https://ttytoolkit.org/
- Are you making a CLI app? Use TTY::Prompt!  
https://medium.com/@ms.hernandeza1/are-you-making-a-cli-app-use-tty-prompt-2d483bd8823b#:~:text=You%20will%20first%20need%20add,new
