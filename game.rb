def choose_random_number
  return rand(100) + 1
end

def ask_for_number
  puts "Pick a number:"
  return gets.chomp.to_i
end

previous_guesses = []

target_number = choose_random_number

puts target_number
puts "Shall we play a game? Guess the number between 1 and 100. You get five tries."

guesses_left = 5
while guesses_left > 0
  guesses_left = guesses_left - 1
  guessed_number = ask_for_number

  if target_number == guessed_number
    puts "You guessed it!"
    break
  elsif target_number < guessed_number && guesses_left > 0
    puts "Too high, try again!:"
  elsif target_number > guessed_number && guesses_left > 0
    puts "Too low, try again!:"
  end

  if previous_guesses.include?(guessed_number)
    puts "Stop that, dummy! Guess a different number!"
  end

  if guesses_left == 0
    puts "You lose!"
  end

  previous_guesses << guessed_number

end
