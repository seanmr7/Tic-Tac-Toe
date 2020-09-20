# Defines game board class and methods
class Board
  def initialize
    @board = [
      ['-', '-', '-'],
      ['-', '-', '-'],
      ['-', '-', '-']
    ]
  end

  def display_board
    @board.each { |arr| p arr }
    puts '---------------'
  end

  def blank_space_check(row, col)
    row = row.to_i
    col = col.to_i
    if @board[row][col] == '-'
      true
    else
      false
    end
  end

  def overwrite_space(row, col, player)
    row = row.to_i
    col = col.to_i
    @board[row][col] = player.token
  end

  def win_check
    rows = @board
    columns = @board.transpose
    rows.each do |arr|
      return arr if arr.all? { |space| space == 'X' } || arr.all? { |space| space == 'O' }
    end
    columns.each do |arr|
      return arr if arr.all? { |space| space == 'X' } || arr.all? { |space| space == 'O' }
    end
    if (
      ((@board[0][0] == 'X' && @board[1][1] == 'X' && @board[2][2] == 'X') ||
      (@board[0][0] == 'O' && @board[1][1] == 'O' && @board[2][2] == 'O')) ||
      ((@board[0][2] == 'X' && @board[1][1] == 'X' && @board[2][0] == 'X') ||
      (@board[0][2] == 'O' && @board[1][1] == 'O' && @board[2][0] == 'O'))
    )
      return arr = [@board[1][1]]
    end

    return true if tie_game

    false
  end

  def tie_game
    true if @board[0].all? { |space| space != '-'} && @board[1].all? { |space| space != '-'} && @board[2].all? { |space| space != '-'}
  end
end

# Defines base Player class
class Player
  attr_accessor :token
  attr_reader :name
  def initialize(name)
    @name = name
    @token = ''
  end

  def pick_a_row
    puts "#{name}'s turn"
    puts "Choose a row #{name}: "
    gets.chomp
  end

  def pick_a_column
    puts "Choose a column #{name}: "
    gets.chomp
  end
end

# creates an X player
class PlayerX < Player
  def initialize(name)
    super(name)
    @token = 'X'
  end
end

# creates an O player
class PlayerO < Player
  def initialize(name)
    super(name)
    @token = 'O'
  end
end

def pick_a_space(player, game_board)
  row = player.pick_a_row
  column = player.pick_a_column
  until game_board.blank_space_check(row, column) == true
    puts 'That spot is already taken.'
    puts "Choose another row #{player.name}: "
    row = gets.chomp
    puts "Choose another column #{player.name}: "
    column = gets.chomp
  end
  game_board.overwrite_space(row, column, player)
end

def play_game(player1, player2, game_board)
  loop do
    game_board.display_board
    pick_a_space(player1, game_board)
    game_board.display_board
    break if game_board.win_check != false

    pick_a_space(player2, game_board)
    game_board.display_board
    break if game_board.win_check != false
  end

  if (game_board.win_check)[0] == 'X'
    puts "#{player1.name} wins!"
  elsif (game_board.win_check)[0] == 'O'
    puts "#{player2.name} wins!"
  else
    puts 'Tie game'
  end
end

game_board = Board.new
player_one = PlayerX.new('PlayerOne')
player_two = PlayerO.new('PlayerTwo')
play_game(player_one, player_two, game_board)
