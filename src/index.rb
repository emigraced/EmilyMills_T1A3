# required
require 'yaml'
require 'tty-prompt'
require 'tty-color'
require 'pastel'
require 'tty-markdown'

# tty inits
prompt = TTY::Prompt.new(symbols: { marker: '♦' }, active_color: :cyan)
pastel = Pastel.new
parsed = TTY::Markdown.parse_file('../docs/gameplay_instructions.md')

# ascii "The Sims" title
def ascii_title
  File.readlines('../docs/ascii_title.txt') do |line|
    puts line
  end
end

# prevents Sim name double ups by checking the Sim library
def does_name_exist(name)
  database = File.read('../data/database.yml')
  name_validation = false
  YAML.load_stream(database) do |doc|
    next if name != doc[:id][:name]

    name_validation = true
    return name_validation
  end
end

# saving created Sims to the database
def save_created_sim(name, gender, life_stage, trait)
  sim_id = { id: { name: name, gender: gender, life_stage: life_stage, trait: trait } }
  File.open('../data/database.yml', 'a+') { |doc| doc.write(sim_id.to_yaml) }
  puts "Hooray, you've successfully created #{name}!"
end

# selecting from saved Sims
def read_sim_library
  log = File.read('../data/database.yml')
  saved_sims_options = []
  YAML.load_stream(log) do |doc|
    saved_sims_options << doc[:id][:name]
  end
  saved_sims_options
end

# finding the sim's trait for probability calculations
def find_trait(sim)
  log = File.read('../data/database.yml')
  YAML.load_stream(log) do |doc|
    if sim == doc[:id][:name]
      $selected_sim_trait = doc[:id][:trait]
    else
      next
    end
    return $selected_sim_trait
  end
end

# randomise interaction response
def probability_generator(array)
  rand_num = rand(5)
  rand_index_generation = array[rand_num]
  $outcome_options[rand_index_generation]
end

# save completed Sim interactions
def save_interactions(interaction_outcome, _initiating_sim, _receiving_sim)
  if interaction_outcome.include?('are now enemies')
  # code
  elsif interaction_outcome.include?('are now friends')
    # code
  end
end

# arrays for the menu options
home_menu_options = ['Create a Sim!', 'Choose a Sim to play', 'View Relationships', 'Read the instructions', 'Exit']
gender_options = %w[female male]
life_stage_options = %w[baby child adult elder]
trait_options = %w[friendly mean]
interaction_options = ['Become friends', 'Become enemies']
$outcome_options = ['Success!', 'Uh oh...']

# probabilities
friendly_probability = [[0, 0, 0, 0, 0], [0, 0, 0, 1, 1]]
# friendly sim choosing to become friends will be 100% successful, friendly sim trying to become enemies will be 60% successful
mean_probability = [[0, 0, 0, 1, 1], [0, 0, 0, 0, 0]]
# mean sim choosing to become friends will be 60% successful, mean sim trying to become enemies will be 100% successful

# menu
puts pastel.cyan('Created by Emily Mills © 2020')
puts ascii_title
puts 'Welcome to The Sims: Command Line Edition!'
sleep(0.5)
user_selection = 0
until user_selection == home_menu_options[-1]
  user_selection = prompt.select('What would you like to do?', home_menu_options)
  case user_selection
  when home_menu_options[0] # create a sim
    sleep(0.5)
    input_gender = prompt.select("Choose your Sim's gender:", gender_options)
    if input_gender == 'female'
      sleep(0.5)
      input_life_stage = prompt.select("What's her life stage?", life_stage_options)
    elsif input_gender == 'male'
      sleep(0.5)
      input_life_stage = prompt.select("What's his life stage?", life_stage_options)
    end
    if input_gender == 'female'
      sleep(0.5)
      input_trait = prompt.select('What kind of Sim will she be?', trait_options)
    elsif input_gender == 'male'
      sleep(0.5)
      input_trait = prompt.select('What kind of Sim will he be?', trait_options)
    end
    sleep(0.5)
    puts 'Finally, give your Sim a first name:'
    can_continue = nil
    until can_continue == true
      input_name = gets.strip.capitalize
      name_created = does_name_exist(input_name)
      if name_created == true || input_name.length == 0
        puts pastel.bright_yellow("Oops! That's invalid. Please try again with a different name. (Sim names need to be unique!)")
      else
        name_created == false
        can_continue = true
        save_created_sim(input_name, input_gender, input_life_stage, input_trait)
      end
    end
    sleep(1)
  when home_menu_options[1] # choose a sim to play
    sim_library = YAML.load(File.read('../data/database.yml'))
    if sim_library == false || read_sim_library.size < 2
      puts pastel.bright_yellow('Oops! You need to create at least two Sims first. Please make a different selection.')
      next
    else
      selected_sim = prompt.select('Please select a Sim', read_sim_library)
    end
    updated_sim_selections = read_sim_library
    updated_sim_selections.each_with_index do |sim, index|
      if sim == selected_sim
        updated_sim_selections.delete_at(index)
        updated_sim_selections.insert(index, { name: selected_sim.to_s, disabled: '(already selected)' })
      else
        next
      end
    end
    recipient_sim = prompt.select("And who would you like #{selected_sim} to interact with?", updated_sim_selections)
    chosen_interaction = prompt.select("How would you like #{selected_sim} to interact with #{recipient_sim}?", interaction_options)
    find_trait(selected_sim)
    if chosen_interaction == interaction_options[0] && $selected_sim_trait == 'friendly' # friendly selects become friends
      result = probability_generator(friendly_probability[0])
      puts result
      outcome = "#{selected_sim} and #{recipient_sim} are now friends :)"
      puts pastel.bright_magenta(outcome)
      save_interactions(outcome, selected_sim, recipient_sim)
    elsif chosen_interaction == interaction_options[1] && $selected_sim_trait == 'friendly' # friendly selects become enemies
      result = probability_generator(friendly_probability[1])
      puts result
      sleep(0.5)
      if result == $outcome_options[1]
        outcome = "Because #{selected_sim} is friendly, they didn't have what it takes to be mean this time. #{selected_sim} and #{recipient_sim} are now friends :)"
        puts pastel.bright_magenta(outcome)
        save_interactions(outcome, selected_sim, recipient_sim)
      elsif result == $outcome_options[0]
        outcome = "#{selected_sim} and #{recipient_sim} are now enemies >:D"
        puts pastel.bright_red(outcome)
        save_interactions(outcome, selected_sim, recipient_sim)
      end
    elsif chosen_interaction == interaction_options[0] && $selected_sim_trait == 'mean' # mean selects become friends
      result = probability_generator(mean_probability[0])
      puts result
      sleep(0.5)
      if result == $outcome_options[1]
        outcome = "Because #{selected_sim} is mean, they failed to make friends this time! #{selected_sim} and #{recipient_sim} are now enemies :("
        puts pastel.bright_red(outcome)
        save_interactions(outcome, selected_sim, recipient_sim)
      elsif result == $outcome_options[0]
        outcome = "#{selected_sim} and #{recipient_sim} are now friends!"
        puts pastel.bright_magenta(outcome)
        save_interactions(outcome, selected_sim, recipient_sim)
      end
    elsif chosen_interaction == interaction_options[1] && $selected_sim_trait == 'mean' # mean selects become enemies
      result = probability_generator(mean_probability[1])
      puts result
      outcome = "#{selected_sim} and #{recipient_sim} are now enemies >:D"
      puts pastel.bright_red(outcome)
      save_interactions(outcome, selected_sim, recipient_sim)
    end
    sleep(1)
  when home_menu_options[2] # view relationships
    # code
    sleep(1)
  when home_menu_options[3] # instructions
    puts parsed
    sleep(1)
  end
end