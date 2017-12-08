# Question 1
def balance(list)
  @lowest_depth = ""
  @list = list

  list.each do |program|
    find_lowest(program[0])
  end
  puts "name = #{@lowest_depth[0]}"
  puts "object = #{@lowest_depth}"

  for i in 2..@lowest_depth.length - 1
    puts @lowest_depth[i]
  end
end

def find_lowest(search_item)
  @list.each do |program|
    if program.length > 2
      valid = program[0].eql?(search_item)
      if program.include? search_item and !valid
        @lowest_depth = program
        find_lowest(program[0])
      end
    end
  end
end

#Question 2
def balance2(list)
  @lowest_depth = ""
  @list = list
  @current_weight = 0

  list.each do |program|
    find_lowest(program[0])
  end

  find_highest_value_in_tree(@lowest_depth[0])
end

def find_highest_value_in_tree(name)
  puts "Incoming Name: #{name}"
  current = find_in_array(name)
  tree = []
  for i in 2..current.length - 1
    find_weights(current[i])
    tree.push([current[i],@current_weight])
    @current_weight = 0
  end

  if tree.length > 1
    puts "Current tree: #{tree}"
    highest = ["", 0]
    tree.each do |item|
      if item[1] > highest[1]
        highest = item
      end
    end
    puts "Highest: #{highest}"
    puts "individual value: #{highest[0]}: #{get_value(find_in_array(highest[0])[1])}"
    find_highest_value_in_tree(highest[0])
  end
end

def find_weights(lowest)
  #Find the weight in each column of the tree
  current = find_in_array(lowest)
  @current_weight += get_value(current[1])
  if current.length > 2
    for i in 2..current.length - 1
      #search for each item, add weight, iterate through each of them
      find_weights(current[i])
    end
  end
end

def find_in_array(name)
  @list.each do |item|
    if item[0].eql?(name)
      return item
    end
  end
end

def get_value(input)
  return input.to_s.gsub(")", "").gsub("(", "").to_i
end
