# Question 1

# def count(lengths_array)
#   skip = 0
#   starting_point = 0

#   characters_array = []
#   for i in 0..255 do
#     characters_array.push(i)
#   end
#   lengths_array.each do |length|
#     end_point = starting_point + length.to_i
#     temp = []
#     for i in starting_point..(end_point - 1)
#       if i >= characters_array.length
#         temp.push(characters_array[(i - characters_array.length)])
#       else
#         temp.push(characters_array[i])
#       end
#     end
#     temp = temp.reverse
#     for  i in starting_point..(end_point - 1)
#       if i >- characters_array.length
#         characters_array[i - characters_array.length] = temp[i - starting_point]
#       else
#         characters_array[i] = temp[i - starting_point]
#       end
#     end
#     starting_point += length.to_i + skip
#     if starting_point > characters_array.length
#       starting_point -= characters_array.length
#     end
#     skip += 1
#   end
#   result = characters_array[0] * characters_array[1]
#   puts "Result: #{result}"
# end

# Question 2

def count2(lengths_array)
  suffix = ",17,31,73,47,23"
  char_array = (lengths_array.pack('U*') + suffix).split(',')

  skip = -1
  starting_point = 0

  characters_array = []
  for i in 0..255 do
    characters_array.push(i)
  end
  for i in 0..64 do
    char_array.each do |length|
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
      skip += 1
      if skip.eql? characters_array.length
        skip = 0
      end
      next_point = length.to_i + skip
      if next_point > characters_array.length
        next_point -= characters_array.length
      end
      starting_point += next_point
      if starting_point > characters_array.length
        starting_point -= characters_array.length
      end
    end
  end
  puts "#{characters_array}"
end

def print_out(var)
  puts "#{var}"
end

count2([49, 57, 50, 44, 54, 57, 44, 49, 54, 56, 44, 49, 54, 48, 44, 55, 56, 44, 49, 44, 49, 54, 54, 44, 50, 56, 44, 48, 44, 56, 51, 44, 49, 57, 56, 44, 50, 44, 50, 53, 52, 44, 50, 53, 53, 44, 52, 49, 44, 49, 50])
