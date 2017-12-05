def calculate(numberArray)
  difference = 0
  numberArray.each do |individual|
    sorted = individual.sort
    difference += sorted.last - sorted.first
  end
  puts difference
end
