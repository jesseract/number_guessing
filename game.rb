def computer_guess
  return rand(100)+1
end

def ask_for_number
  puts "Pick a number:"
  return gets.chomp.to_i
end

previous_guesses = []

target_number = computer_guess

puts "Shall we play a game? Guess the number between 1 and 100. You get five tries."

guesses_left = 5
while guesses_left > 0
  guesses_left = guesses_left - 1
  guessed_number = ask_for_number

  if target_number < guessed_number && guesses_left > 0
    puts "Too high, try again!:"
  end

  if target_number > guessed_number && guesses_left > 0
    puts "Too low, try again!:"
  end

  if previous_guesses.include?(guessed_number)
    puts "Stop that, dummy!"
  end

  if guesses_left == 0
    puts "You lose!"
  end

  previous_guesses << guessed_number

end
#comment
