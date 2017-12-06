#Question 1

def move(memory_block)
  arr = memory_block.dup
  options_arr = []
  options_arr.push(memory_block)
  valid = true
  count = 0
  while valid == true
    copy = arr.dup
    result = move_blocks(copy)
    count += 1
    if options_arr.include? result
      valid = false
    else
      options_arr.push(result)
      arr = copy
    end
  end
  puts count
end

def move_blocks(memory)
  largest = memory.sort.last
  starting_index = memory.index(largest)
  memory[starting_index] = 0
  
  if starting_index >= memory.count - 1
    starting_index = 0
  else
    starting_index += 1
  end
  while largest > 0
    memory[starting_index] += 1
    largest -=1
    starting_index += 1
    if starting_index > memory.count - 1
      starting_index = 0
    end
  end
  return memory
end

# move([0,2,7,0])
# move([4,1,15,12,0,9,9,5,5,8,7,3,14,5,12,3])

#Question 2

def move2(memory_block)
  arr = memory_block.dup
  options_arr = []
  options_arr.push(memory_block)
  valid = true
  first_found = false
  first = ""
  count = 0
  while valid == true
    copy = arr.dup
    result = move_blocks(copy)
    count += 1
    if options_arr.include? result
      if !first_found
        first = result
        first_found = true
        count = 0
      end
    end
    options_arr.push(result)
    if options_arr.count(first) > 2
      valid = false
    end
    arr = copy
  end
  puts count
end

def move_blocks2(memory)
  largest = memory.sort.last
  starting_index = memory.index(largest)
  memory[starting_index] = 0
  
  if starting_index >= memory.count - 1
    starting_index = 0
  else
    starting_index += 1
  end
  while largest > 0
    memory[starting_index] += 1
    largest -=1
    starting_index += 1
    if starting_index > memory.count - 1
      starting_index = 0
    end
  end
  return memory
end

# move2([0,2,7,0])
move2([4,1,15,12,0,9,9,5,5,8,7,3,14,5,12,3])

