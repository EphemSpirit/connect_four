class Board

  attr_reader :board
  attr_accessor :sign

  @@rows = 6
  @@columns = 7

  def initialize
    @board = make_board
    #game_rules
  end

  def make_board
    board = Array.new(@@rows){ Array.new(@@columns, " ") }
    return board
  end

  def print_board
    i = 0
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
      puts "That column is filled, please try again"
      false
    end
    true
  end

  def mark_square(player, choice)
    index = 0
    move_made = false
    column = @board.collect{ |row| row[choice-1] }
    column.pop
    column.reverse!
    until move_made
      if column[index] == " "
        @board[@board.length - (index + 2)][choice - 1] = player.marker
        move_made = true
      end
      index += 1
    end
  end

end
