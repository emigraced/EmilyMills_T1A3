outcome_options = ["Success!", "Uh oh..."]

def probability_generator(array)
    rand_num = rand(5)
    rand_index_generation = array[rand_num]
    outcome = outcome_options[rand_index_generation]
    return outcome
end

puts probability_generator([0,0,1,1,0])

#puts defined?(outcome_options)