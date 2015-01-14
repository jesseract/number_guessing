def choose_random_number
  #this makes a range and puts it into an array, from which it samples a random number
  return (1..100).to_a.sample
end

def ask_for_number
  puts "Pick a number"
  return gets.chomp.to_i
end

#Since 100 and 1 are reasonable guesses, I made the range outside the specs for the game
high_number = 101
low_number = 0

previous_guesses = []

target_number = choose_random_number

#places the computer's guess at the beginning
#puts target_number

puts "Shall we play a game? Guess the number between 1 and 100. You get five tries."

guesses_left = 5
while guesses_left > 0
  guesses_left = guesses_left - 1
  guessed_number = ask_for_number

  if target_number == guessed_number
    puts "You guessed it! A winnar is you!"
    break
  #when you guess a number that is too high, the range of numbers in low_number and high_number
  #changes to reflect that. If I tell you that a guess is too high, and after that you guess higher,
  #then I call you an idiot.
  elsif target_number < guessed_number && guesses_left > 0
    if guessed_number >= high_number
      puts "You're an idiot, you knew that was too high"
    else
      puts "Too high, try again!"
      high_number = guessed_number
    end
  #see above comment
  elsif target_number > guessed_number && guesses_left > 0
    if guessed_number <= low_number
      puts "You're an idiot, you knew that was too low"
    else
      puts "Too low, try again!"
      low_number = guessed_number
    end
  end

  #if you repeat a number you've previously guessed, then I mock you.
  if previous_guesses.include?(guessed_number)
    puts "Stop that, dummy! Guess a different number!"
  end

  #when you run out of guesses, you lose the game
  if guesses_left == 0
    puts "You lose!"
  end

  #in response for testing purposes
  # puts low_number
  # puts high_number

  #this puts the numbers that I guess into the previous_guesses array
  previous_guesses << guessed_number
end
