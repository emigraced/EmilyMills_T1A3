#required
require "tty-prompt"
require "yaml"

#tty prompt
prompt = TTY::Prompt.new(symbols: {marker: "♦"})

#ascii "The Sims" title
def ascii_title
  File.readlines("../docs/ascii_title.txt") do |line|
    puts line
  end
end



#saving created sims to the database file
def save_created_sim(name, gender, life_stage, trait)
    sim_id = {:id => {:name => name, :gender => gender, :life_stage => life_stage, :trait => trait}}
    File.open("../data/database.yml", "a+") { |file| file.write(sim_id.to_yaml) }
    puts "Hooray, you've successfully created #{name}!"
end

#arrays for the menu method
home_menu_options = ["Create a Sim!", "Continue playing", "Read the instructions", "Exit"]
gender_options = ["female", "male"]
life_stage_options = ["baby", "child", "adult", "elder"]
trait_options = ["friendly", "mean"]

#welcome menu
puts ascii_title
puts "Welcome to The Sims: Command Line Edition!"
sleep(0.5)
user_selection = 0
until user_selection == home_menu_options[-1]
user_selection = prompt.select("What would you like to do?", home_menu_options)
case user_selection
when home_menu_options[0]
    sleep(0.5)
    input_gender = prompt.select("Choose your Sim's gender:", gender_options)
    if input_gender == "female"
        sleep(0.5)
        input_life_stage = prompt.select("What's her life stage?", life_stage_options)
    elsif input_gender == "male"
        sleep(0.5)
        input_life_stage = prompt.select("What's his life stage?", life_stage_options)
    end
    sleep(0.5)
    if input_gender == "female"
        sleep(0.5)
        input_trait = prompt.select("What kind of Sim will she be?", trait_options)
    elsif input_gender == "male"
        sleep(0.5)
        input_trait = prompt.select("What kind of Sim will he be?", trait_options)
    end
    sleep(0.5)
    puts "Finally, give your Sim a first name:"
    input_name = gets.strip
    save_created_sim(input_name, input_gender, input_life_stage, input_trait)
when home_menu_options[1]
    #if database == empty, puts "You haven't created any Sims yet. Please return to the main menu and make a different selection."
    #else:
    select_sim = prompt.select("Which Sim would you like to play?", YAML.load(File.read("../data/database.yml"))[:id][:name])
when home_menu_options[2]
    #puts rules
end
end

#need classes! sims, interactions, households, summary
#when this game is ready to be shared, you need to replace your database.yml file with a template (because you don't want other people to have your database!). Maybe a git-ignore on the yml file?
#add option for erasing saved file and starting again? Maybe a second array that's applied instead if the database.yml file is empty?


