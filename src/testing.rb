#stops name double ups. does not allow new sims to be created. does not allow name retry
# def does_name_exist(name)
#     log = File.read("../data/database.yml")
#     created = nil
#     YAML::load_stream(log) do |doc| 
#         next unless name == doc[:id][:name]
#             created = true
#         end
#     return created
# end
def does_name_exist(name)
    log = File.read("../data/database.yml")
    name_validation = false
    YAML::load_stream(log) do |doc| 
        next if name != doc[:id][:name]
            name_validation = true 
            return name_validation
        end
end