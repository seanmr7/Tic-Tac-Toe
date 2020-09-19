class Board
  def initialize
    @board = [
      [0, 0, 0],
      [0, 0, 0],
      [0, 0, 0]
    ]
  end

  def display_board
    @board.each { |arr| p arr }
  end

  def overwrite_space(row, col, player)
    row = row.to_i
    col = col.to_i
    if (@board[row][col]).zero?
      @board[row][col] = player.token
    else
      false
    end
  end
  
  def win_check
    @board.each do
      @board
    end

end

# Defines base Player class
class Player
  attr_accessor :token
  def initialize(name)
    @name = name
    @token = ''
  end

  def pick_row
    p 'Choose a row: '
    gets.chomp
  end

  def pick_column
    p 'Choose a column: '
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

def play_game(player1, player2) end

game_board = Board.new
player_one = PlayerX.new('PlayerOne')
player_two = PlayerO.new('PlayerTwo')

p player_one.token
p player_two.token
game_board.display_board

game_board.overwrite_space(0,0,player_one)
game_board.display_board