require "tty-prompt"

prompt = TTY::Prompt.new

puts "Welcome to The Sims: Command Line Edition!"
prompt.select("What would you like to do first?", ["Create a Sim!", "Continue playing", "Read the instructions"])
    