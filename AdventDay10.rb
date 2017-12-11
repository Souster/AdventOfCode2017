def run(iteration_count, desired)
  arr = [[0,0,0],[0,1,0],[0,0,0]]
  i = 1
  j = 1
  current_ring = 2
  up = 2
  left = 2
  bottom = 2
  right = 2
  max_rings_to_make = current_ring + (iteration_count)
  value_to_add = 1
  add = true
  while i <= current_ring and j <= current_ring
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
      value_to_add = calculate_next_value(arr,i,j)
      puts "I: #{i}, J: #{j}, value:#{value}"

      if value_to_add > desired
        puts "First Value > #{desired}: #{value_to_add}"
        break
      end
      arr[i][j] = value_to_add
    end
    add = true
  end
end

def calculate_next_value(arr,down,across)
  total = 0
  begin
    for i in (down-1)..(down+1)
      for j in (across-1)..(across+1)
        if i < 0
          total += 0
        elsif j < 0
          total += 0
        else
          total += arr[i][j].to_i
        end
      end
    end
  rescue
    total += 0
  end
  return total
end

run(21, 361527)
