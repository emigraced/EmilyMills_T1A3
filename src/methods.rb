#ascii "The Sims" title
def ascii_title
  File.readlines("../docs/ascii_title.txt") do |line|
    puts line
  end
end

#saving created sims to the database file
def save_created_sim(name, gender, life_stage, trait)
    sim_id = {:id => {:name => name, :gender => gender, :life_stage => life_stage, :trait => trait}}
    File.open("../data/database.yml", "a+") { |doc| doc.write(sim_id.to_yaml) }
    puts "Hooray, you've successfully created #{name}!"
end

#(NOT YET CORRECTLY IMPLEMENTED) ensuring no name double ups for sims by checking the sim library 
def does_name_exist(name)
    log = File.read("../data/database.yml")
    YAML::load_stream(log) do |doc| 
        if name == doc[:id][:name]
            true
        else
            false
        end
    end
end

#selecting from saved sims
def read_sim_library
    log = File.read("../data/database.yml")
    saved_sims_options = []
    YAML::load_stream(log) do |doc| 
        saved_sims_options << "#{doc[:id][:name]}"
    end
return saved_sims_options
end

#(NOT YET WORKING) deleting sims
def delete_sim(sim)
    log = File.open("../data/database.yml")
    YAML::load_stream(log) do |doc| 
        if sim == doc[:id][:name]
            delete.(doc)
            puts "You've successfully deleted #{sim}"
        else
            puts "Error"
            break
        end
    end
end

#finding the sim's trait for probability calculations
def find_trait(sim)
    log = File.read("../data/database.yml")
    YAML::load_stream(log) do |doc| 
            if sim == doc[:id][:name]
            $selected_sim_trait = doc[:id][:trait]
            else
                next 
            end
        return $selected_sim_trait
    end
end

#randomise interaction response
def probability_generator(array)
    rand_num = rand(5)
    rand_index_generation = array[rand_num]
    outcome = $outcome_options[rand_index_generation]
    return outcome
end

def save_interactions(interaction_outcome, initiating_sim, receiving_sim)
    occured_interactions = []
    occured_interactions << interaction_outcome #wrong. this is going to put "success" or "uh oh" in the array...
end
