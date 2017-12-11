# def count(lengths_array)
#   skip = 0
#   starting_point = 0

#   characters_array = []
#   for i in 0..10 do
#     characters_array.push(i)
#   end
  
#   lengths_array.each do |length|
#     puts "Before: #{characters_array}"
#     temp = []
#     end_point = starting_point + length.to_i

#     if end_point > characters_array.length
#       remainder_from_start = end_point - characters_array.length
#       for i in starting_point..(characters_array.length - 1)
#         temp.push(characters_array[i])
#       end
#       for i in 0.. remainder_from_start - 1
#         temp.push(characters_array[i])
#       end
#       temp = temp.reverse
#       puts "Temp: #{temp}"

#       for i in 0..(temp.count - 1)
#         characters_array[i + starting_point] = temp[i]
#       end

#       # for i in 0..remainder_from_start - 1
#       #   characters_array[i] = temp[i]
#       # end
#       # for i in remainder_from_start - 1..(temp.count)
#       #   characters_array[i + starting_point] = temp[i]
#       # end
#       puts "After : #{characters_array}"
#     else
#       for i in starting_point..(end_point - 1)
#         temp.push(characters_array[i])
#       end
#       temp = temp.reverse

#       for i in 0..(temp.count - 1)
#         characters_array[i + starting_point] = temp[i]
#       end
#       puts "After : #{characters_array}"
#       starting_point += (length.to_i + skip)
#       skip += 1s
#       puts "Start point : #{starting_point}"
#     end
#   end
# end

def count(lengths_array)
  skip = 0
  starting_point = 0

  characters_array = []
  for i in 0..255 do
    characters_array.push(i)
  end
  lengths_array.each do |length|
    end_point = starting_point + length.to_i
    temp = []
    for i in starting_point..(end_point - 1)
      if i >= characters_array.length
        temp.push(characters_array[(i - characters_array.length)])
      else
        temp.push(characters_array[i])
      end
    end
    temp = temp.reverse
    for  i in starting_point..(end_point - 1)
      if i >- characters_array.length
        characters_array[i - characters_array.length] = temp[i - starting_point]
      else
        characters_array[i] = temp[i - starting_point]
      end
    end
    starting_point += length.to_i + skip
    if starting_point > characters_array.length
      starting_point -= characters_array.length
    end
    skip += 1
  end
  result = characters_array[0] * characters_array[1]
  puts "Result: #{result}"
end

count(["192","69","168","160","78","1","166","28","0","83","198","2","254","255","41","12"])
