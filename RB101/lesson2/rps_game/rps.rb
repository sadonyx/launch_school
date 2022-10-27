CHOICES = ['rock', 'paper', 'scissors']

def prompt(message)
  puts("=> #{message}")
end

def results(player, computer)
  if (player == 'rock' && computer == 'scissors') ||
      (player == 'paper' && computer == 'rock') ||
      (player == 'scissors' && computer == 'paper')
    "You win!"
  elsif (player == computer)
    "It's a draw!"
  else
    "You lose! :("
  end
end

play_again = 'y'
while play_again == 'y'
  choice = ''
  loop do
    prompt("Choose one: #{CHOICES.join(', ')}.")
    choice = gets.chomp.downcase

    if CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = CHOICES.sample

  prompt("You chose #{choice}. Computer chose #{computer_choice}.")

  prompt(results(choice, computer_choice))

  prompt("Would you like to play again? (Y/n)")
  play_again = gets.chomp.downcase
end

prompt("Thank you for playing rock, paper, scissors. Good bye!")