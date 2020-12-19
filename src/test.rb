require "yaml"

#Alex's idea
def find_trait(name)
    database = YAML.load_file("../data/database.yml")
    database.find do |doc| 
        next unless doc[:id][:name] == name
        $result = doc[:id][:trait]
    end
    return $result
end 

puts find_trait("Joy")

#deleting sims WORKS but wrong format
# def delete_sim(sim)
#     updated_database = []
#     YAML::load_stream(File.open("../data/database.yml", "a+")) do |doc| 
#         next if sim == doc[:id][:name]
#         {:id => doc[:id]}.to_yaml
#         updated_database << {:id => doc[:id]}
#     end
#     #YAML::dump(updated_database, :indentation => 3)
#     File.write("../data/database.yml", updated_database.to_yaml, :indentation => 3)
#     # puts "You've successfully deleted #{sim}"
# end

#  puts "Finally, give your Sim a first name:"
#     can_continue = nil
#     until can_continue == true
#         input_name = gets.strip.capitalize
#         name_created = does_name_exist(input_name)
#         if name_created == true || input_name.length == 0
#             puts pastel.bright_yellow("Oops! That's invalid. Please try again with a different name. (Sim names need to be unique!)")
#         else name_created == false
#             can_continue = true
#             save_created_sim(input_name, input_gender, input_life_stage, input_trait)
#         end
#     end