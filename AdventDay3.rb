number = 361527

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
