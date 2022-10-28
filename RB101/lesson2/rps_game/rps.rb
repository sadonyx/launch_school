CHOICES = %w(rock paper scissors lizard spock)

def prompt(message)
  puts("=> #{message}")
end

def win?(winner, loser)
  ((winner == 'rock' || winner == 'spock') && loser == 'scissors') ||
  ((winner == 'paper' || winner == 'spock') && loser == 'rock') ||
  ((winner == 'scissors' || winner == 'lizard') && loser == 'paper') ||
  ((winner == 'rock' || winner == 'scissors') && loser == 'lizard') ||
  ((winner == 'paper' || winner == 'lizard') && loser == 'spock')
end

def results(player, computer)
  if win?(player, computer)
    "You won this round!"
  elsif win?(computer, player)
    "You lost this round!"
  else
    "It's a draw!"
  end
end

def choice_validator(input)
  (CHOICES.select { |choice| choice[0] == input[0] && choice[1] == input[1] })[0]
end

def update_score(player, computer, score_arr)
  if win?(player, computer)
    score_arr[0] += 1
  elsif win?(computer, player)
    score_arr[1] += 1
  end
end

def grand_results(score_arr)
  score_arr[0] == 3 ? "You are the grand winner. Congratulations!" : "You are the grand loser. Boo-hoo!"
end

play_again = 'y'

while play_again == 'y'

  game_score = [0, 0] # [player, computer]

  until game_score.include?(3)
    choice = ''
    loop do
      prompt("Choose one: #{CHOICES.join(', ')}.")
      choice = gets.chomp.downcase
      if choice_validator(choice)
        choice = choice_validator(choice)
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    computer_choice = CHOICES.sample

    update_score(choice, computer_choice, game_score)

    prompt("You chose #{choice}. Computer chose #{computer_choice}.")
    prompt(results(choice, computer_choice))
    prompt("Your score is #{game_score[0]}. The computer's score is #{game_score[1]}.")
  end

  prompt(grand_results(game_score))

  prompt("Would you like to play again? (Y/n)")
  play_again = gets.chomp.downcase
end

prompt("Thank you for playing rock, paper, scissors. Good bye!")
