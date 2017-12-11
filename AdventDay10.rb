# arr = [[0,0,0],[0,1,0],[0,0,0]]
# puts "#{arr}"
# arr.unshift(["a","b"])
# arr.push(["y","z"])
# arr[1].unshift("b")

def run(iteration_count)
  #Do dynamic pushing and unshifting based on current size vs orignal in i and j increment steps
  arr = [[0,0,0],[0,1,0],[0,0,0]]
  i = 1
  j = 1
  original_size = 2
  current_ring = 2
  up = 2
  left = 2
  bottom = 2
  right = 2
  max_rings_to_make = current_ring + (iteration_count)
  value_to_add = 1
  add = true

  while i <= current_ring and j <= current_ring
    value_to_add += 1
    if (i < current_ring and i > 0) and (j < current_ring and j > 0)
      j += 1
    elsif (i > 0 and i < current_ring) and  j == current_ring
      i -= 1
    elsif i == 0 and j == current_ring
      if up != current_ring
        arr.unshift([])
        up += 1
        j += 1
      end
      j -= 1 
    elsif i == 0 and (j < current_ring and j > 0)
      j -= 1
    elsif i == 0 and j == 0 and left < up
      arr.each do |row|
        row.unshift(0)
      end
      left += 1
    elsif i < current_ring and j == 0
      i += 1
    elsif i == current_ring and j < current_ring
      if bottom != current_ring
        current_ring += 1
        up += 1
        left += 1
        i += 1
        arr.push([])
        bottom += 2
        j -= 1
      end
      j += 1
    elsif i == current_ring and j == current_ring
      if current_ring <=  max_rings_to_make
        if right != current_ring
          arr.each do |column|
            column.push(0)
          end
          right += 1
        end
        current_ring += 1
        value_to_add -= 1
        add = false
      else
        break
      end
    end
    if add
      print_i_and_j(i,j, value_to_add)
      arr[i][j] = value_to_add
      puts "Arr: #{arr}"
    end
    add = true
  end
end

def print_i_and_j(i,j,value)
  puts "I: #{i}, J: #{j}, value:#{value}"
end

run(3)
