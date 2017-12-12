# Question 1

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
# count("192,69,168,160,78,1,166,28,0,83,198,2,254,255,41,12")

# Question 2

def count2(lengths_array)
  char_array = (lengths_array.unpack('U*'))
  char_array.push(17,31,73,47,23)

  skip = -1
  starting_point = 0

  characters_array = []
  for i in 0..255 do
    characters_array.push(i)
  end
  for i in 0..63 do
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
  split_array = characters_array.each_slice(16)
  xors = []

  split_array.each do |arr|
    xor = arr[0]
    for i in 1..15
      xor = xor ^ arr[i]
    end
    xors.push(xor)
  end
  hex_string = ""

  xors.each do |xor|
    new_hex = xor.to_s(16)
    if new_hex.length < 2
      new_hex = "0" + new_hex
    end
    hex_string += new_hex
  end
  puts "hex: #{hex_string}"
end
count2("192,69,168,160,78,1,166,28,0,83,198,2,254,255,41,12")
