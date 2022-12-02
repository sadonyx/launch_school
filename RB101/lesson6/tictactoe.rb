WINNING_LINES = [[1,2,3],[4,5,6],[7,8,9]] + # rows
                [[1,4,7],[2,5,8],[3,6,9]] + # cols
                [[1,5,9],[3,5,7]]           # diagonals

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

scoreboard = {'Player' => 0, 'Computer' => 0}

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop: disable Metrics/MethodLength, Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You're a '#{PLAYER_MARKER}'."
  puts "Computer is a '#{COMPUTER_MARKER}'."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
  p find_winning_square(brd)
end
# rubocop: enable Metrics/MethodLength, Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select{ |num| brd[num] == INITIAL_MARKER }
end

def player_move!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  
  brd[square] = PLAYER_MARKER
end

def find_at_risk_square(brd)
  WINNING_LINES.each do |line| # arr
    if brd.values_at(*line).count(PLAYER_MARKER) == 2 && brd.values_at(*line).count(COMPUTER_MARKER) != 1 
      return line.select { |sqr| brd[sqr] == ' ' }[0]
    end
  end
end

def find_winning_square(brd)
  WINNING_LINES.each do |line| # arr
    if brd.values_at(*line).count(COMPUTER_MARKER) == 2 && brd.values_at(*line).count(' ') == 1 
      return line.select { |sqr| brd[sqr] == ' ' }[0]
    end
  end
end

def computer_move!(brd)
  if empty_squares(brd).include?(5)
    brd[5] = COMPUTER_MARKER
  elsif find_winning_square(brd).is_a? Integer
    brd[find_winning_square(brd)] = COMPUTER_MARKER
  elsif find_at_risk_square(brd).is_a? Integer
    brd[find_at_risk_square(brd)] = COMPUTER_MARKER
  else
    square = empty_squares(brd).sample
    brd[square] = COMPUTER_MARKER
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line| # arr
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def update_scoreboard!(winner, scoreboard)
  scoreboard[winner] += 1
end

def joinor(arr, delimiter = ',', separator = 'or')
  case arr.size
  when 0 then ''
  when 1
    arr[0].to_s
  when 2
    arr.join("#{separator} ")
  else
    arr[0...-1].join("#{delimiter} ") + "#{delimiter} #{separator} " + arr[-1].to_s
  end
end

loop do
  board = initialize_board

  loop do
    display_board(board)

    player_move!(board)
    break if someone_won?(board) || board_full?(board)

    computer_move!(board)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    update_scoreboard!(detect_winner(board), scoreboard)
    prompt "#{detect_winner(board)} won the match!"
    prompt "The updated score is: Player => #{scoreboard['Player']} ; Computer => #{scoreboard['Computer']}"
  else
    prompt "It's a tie!"
    prompt "The score remains: Player => #{scoreboard['Player']} ; Computer => #{scoreboard['Computer']}"
  end

  if scoreboard.values.include?(5)
    prompt "#{scoreboard.key(5)} won the game. Would you like to play again? (y or n)"
    answer = gets.chomp
    answer.downcase.start_with?('y') ? scoreboard = {'Player' => 0, 'Computer' => 0} : break
  end

  prompt "Press enter to continue."
  continue = gets

end

prompt "Thanks for playing Tic Tac Toe. Goodbye!"