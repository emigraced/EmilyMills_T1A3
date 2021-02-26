# The Sims: Command Line Edition

Welcome! 

I made a command line app based on The Sims. You can create Sims, make them interact, and record who's friends with who -- or enemies!

Check out the instructions within the app. 

Hope you enjoy :) 

Emily 

---
## Help Documentation


### Application Installation

To run this app for the first time, execute the following in your command line: 
```
./script.sh
```
The Gems required to run this app will be automatically installed for you.

The following are optional commands: 
- Replace [name] with your name (ie, `./script.sh emily`), and receive a personalised greeting from the app!
```
./script.sh [name]
```
- If you find that your Sim library is getting out of hand, this command will erase the Sim library so that you can start the game afresh. 
```
./script.sh [name] erase
```
Once you have run the app for the first time on your computer you may prefer to swap out `./script.sh` for `./index.rb` for faster launch time. (You can still add on the name and erase commands if desired. This alternate method simply skips the Gem installation process when you know you've already installed them.)

### Dependancies

This app requires the following Ruby Gems (all of which will be installed when you run `./script.sh`):
- tty-prompt
- tty-markdown
- tty-color
- tty-table
- pastel

### System/hardware Requirements

This app was created and tested using Ubuntu on WSL, with Ruby version 2.7.1. No guarantees can be made for the performance of the app in other environments.

---
