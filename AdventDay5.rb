#Question 1

def maze_escape(instructions)
  number_of_jumps = 0
  current_pos = 0

  while current_pos < instructions.count
    old_pos = current_pos
    current_pos += instructions[current_pos]
    number_of_jumps += 1
    instructions[old_pos] = instructions[old_pos] + 1
  end
  puts "Number of jumps: #{number_of_jumps}"
end

#Question 2

def maze_escape2(instructions)
  number_of_jumps = 0
  current_pos = 0

  while current_pos < instructions.count
    old_pos = current_pos
    current_pos += instructions[current_pos]
    number_of_jumps += 1
    if instructions[old_pos] >= 3
      instructions[old_pos] = instructions[old_pos] - 1
    else
      instructions[old_pos] = instructions[old_pos] + 1
    end
  end
  puts "Number of jumps: #{number_of_jumps}"
end
