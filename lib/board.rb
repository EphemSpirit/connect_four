class Board

  attr_reader :board
  attr_accessor :sign

  @@rows = 6
  @@columns = 7

  def initialize
    @board = make_board
    game_rules
  end

  def make_board
    board = Array.new(@@columns){ Array.new(@@rows, " ") }
    return board
  end

  def print_board
    i = 1
    @board.each do |row|
      print @board[i]
      puts
      i += 1
    end
  end

  def game_rules
    puts "The game is Connect Four: Aim to get four of your pieces connected to win!"
    puts "To select a row, pick a number between 1 and 7\n\n"
  end

  #fix this
  def valid_move?(choice)
    choice = choice - 1
    if !(choice.between?(0, 6))
      puts "Please put in a valid column number (1 to 7)"
      false
    elsif board[0][choice - 1] != " "
      puts "That spot is filled, please try again"
      false
    elsif board.each{ |row| row[choice] != " " }
      puts "That column is full, please try again!"
    end
    true
  end

  def mark_square(player, choice)
    column = choice
    (0..5).each do |row|
      if row == 5
        board[row][column] = player.marker
      elsif
        board[row+1][column] != " " && board[row][column] == " "
        board[row][column] = player.marker
      end
    end
  end

  # def find_neighbors(choice)
  #   neighbors = [[choice[0]+1, choice[1]], [choice[0], choice[1]+1], [choice[0]-1, choice[1]], [choice[0], choice[1]-1],
  #                [choice[0]+1, choice[1]+1], [choice[0]-1, choice[1]-1], [choice[0]+1, choice[1]-1], [choice[0]-1, choice[1]+1]]
  #   return neighbors
  # end
  #
  # def winner?
  #   #use a DFS to check the 4 nearest neighbors of each square
  #   stack = []
  #   if choice[0] < 1 || choice[0] > 8
  #     return
  #   elsif
  #     choice[1] < 1 || choice[1] > 8
  #     return
  #   end
  #
  # end

end

board = Board.new
board.print_board
