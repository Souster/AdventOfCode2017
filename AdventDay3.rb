# Question 1

def count_steps(number)
  for i in 1..500000 do
    largest_in_circle = ((i*2)-1) ** 2
    if largest_in_circle >= number
      across = i - 1
      up = 0

      values_arr = []
      for j in 0..3 do
        if j == 0
          temp_arr = []
          temp_arr.push(((i*2)-1) ** 2)
          
          for k in 1..(i*2)-2 do
            starting_point = (((i-1)*2)-1) ** 2
            temp_arr.push(starting_point + k)
          end
          values_arr.push(temp_arr)
        else
          temp_arr = []
          for l in 0..(i*2)-2 do
            starting_point = values_arr[j - 1].last
            value = starting_point + l
            temp_arr.push(value)
          end
          values_arr.push(temp_arr)
        end
      end
      values_arr.each do |arr|
        if arr.include?(number)
          middle_point = (arr.count + 1) / 2
          position_in_row = arr.index(number) + 1

          up = (middle_point - position_in_row).abs
          break
        end
      end

      total = up + across
      puts "total = #{total}"
      break
    end
  end
end
# count_steps(361527)

# Question 2

def find_next_largest(desired)
  arr = [[0,0,0],[0,1,0],[0,0,0]]
  i = 1
  j = 1
  current_ring = 2
  up = 2
  left = 2
  bottom = 2
  right = 2
  max_rings_to_make = 5
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
        add = false
      else
        break
      end
    end
    if add
      value_to_add = calculate_next_value(arr,i,j)
      puts "I: #{i}, J: #{j}, value:#{value_to_add}"
      if value_to_add > desired
        puts "First Value > #{desired}: #{value_to_add}"
        break
      end
      arr[i][j] = value_to_add
    end
    add = true
    max_rings_to_make += 2
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

find_next_largest(361527)
