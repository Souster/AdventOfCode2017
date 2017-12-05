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
validate_passphrase("aa bb cc dd ee")
validate_passphrase("aa bb cc dd aa")
validate_passphrase("aa bb cc dd aaa")
validate_passphrase("aaa bb cc dd aa")

puts "Number of successes: #{$number_of_successes}"
