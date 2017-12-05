#Question 1
def validate_passphrase(phrase)
  words = phrase.split(" ")
  words_arr = []
  valid = true
  words.each do |word|
    if !words_arr.include? word
      words_arr.push word
    else
      valid = false
      break
    end
  end
  if valid
    $number_of_successes += 1
  end
  puts "Validity for #{phrase}: #{valid}"
end

$number_of_successes = 0

validate_for_anagrams("aa bb cc dd ee")
validate_for_anagrams("aa bb cc aa dd")

puts "Number of successes: #{$number_of_successes}"

#Question 2
def validate_for_anagrams(phrase)
  words = phrase.split(" ")
  words_arr = []
  valid = true
  words.each do |word|
    sorted_word = word.split("").sort.join()
    if !words_arr.include? sorted_word
      words_arr.push sorted_word
    else
      valid = false
      break
    end
  end
  if valid
    $number_of_successes += 1
  end
  puts "Validity for #{phrase}: #{valid}"
end

$number_of_successes = 0

validate_for_anagrams("abcde fghij")
validate_for_anagrams("abcde xyz ecdab")

puts "Number of successes: #{$number_of_successes}"
