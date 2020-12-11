require "tty-prompt"

prompt = TTY::Prompt.new

def create_a_sim(name, gender, life_stage)
    #increment sim numbers, or name the array with the name?

    #sim_1 = {:name => name, :gender => gender, :life_stage => life_stage}
    return sim_1
end

intro_options = ["Create a Sim!", "Continue playing", "Read the instructions"]
gender_options = ["female", "male"]
life_stage_options = ["baby", "child", "adult", "elder"]

puts "Welcome to The Sims: Command Line Edition!"
sleep(0.5)
user_selection = prompt.select("What would you like to do first?", intro_options)
case user_selection
when intro_options[0]
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
    puts "Finally, name your Sim:"
    input_name = gets.strip
    create_a_sim(input_name, input_gender, input_life_stage)
when intro_options[1]
    #call function
    #if there's no saved gameplay, alert the user to go back to the original menu and choose one of the other options
when intro_options[2]
    #puts rules
end


