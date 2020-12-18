def delete_sim(sim)
    database = File.open("../data/database.yml")
    updated_database = []
    YAML::load_stream(database) do |doc| 
        next if sim == doc[:id][:name]
            updated_database << [doc[:id]]
            File.open("../data/database.yml", "w") { |new_doc| new_doc.write(updated_database.to_yaml) }
        end
    puts "You've successfully deleted #{sim}"
end