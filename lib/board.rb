require 'pry'

class Board

  attr_reader :board
  attr_accessor :marker

  @@rows = 6
  @@columns = 7

  def initialize
    @board = make_board
    #game_rules
  end

  def make_board
    @board = Array.new(@@rows){ Array.new(@@columns, " ") }
    return @board
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

  def valid_move?(choice)
    choice = choice - 1
    if !(choice.between?(0, 6))
      puts "Please put in a valid column number (1 to 7)"
      return false
    elsif board[0][choice] != " "
      puts "That column is filled, please try again"
      return false
    end
    return true
  end

  def mark_square(player, choice)
    if valid_move?(choice)
      index = 0
      move_made = false
      column = @board.collect{ |row| row[choice-1] }
      column.reverse!
      #binding.pry
      until move_made
        if column[index] == " "
          @board[@board.length - (index + 1)][choice - 1] = player.marker
          move_made = true
        end
        index += 1
      end
    end
  end

  def winner?
    (find_vertical || find_horizontal || find_diagonal || find_anti_diagonal) ? true : false
  end

  def draw?
    board = @board
    !winner? && board.all? { |row| row.none?{ |x| x == " " } }
  end

  def find_vertical
    transposed_board = @board.transpose
    #binding.pry
    transposed_board.any? do |row|
      row.each_cons(4).any?{ |a, b, c, d| a != " " && a == b && b == c && c == d }
    end
  end

  def find_horizontal
    board = @board
    board.any? do |row|
      row.each_cons(4).any?{ |a, b, c, d| a != " " && a == b && b == c && c == d }
    end
  end

  def find_diagonal(final = [])
    board = @board
    diagonal_length, row, position = 4, 2, 0
    until final.length == 6
      arr = []
      diagonal_length.times { |i| arr << @board[i+row][i+position] }
      final << arr
      case final.length
      when 0...3 then row -= 1
      when 3 then position += 1
      when 4..6 then diagonal_length -= 1; position += 1
      end
    end
    #binding.pry
    (final.any? { |arr| arr.all? { |x| x == "R" } }) || (final.any? { |arr| arr.all? { |x| x == "B" } })
  end

  def find_anti_diagonal(final = [])
    reversed_board = @board.reverse
    diagonal_length, row, position = 4, 2, 0
    until final.length == 6
      arr = []
      diagonal_length.times { |i| arr << reversed_board[i+row][i+position] }
      final << arr
      case final.length
      when 0...3 then row -= 1
      when 3 then position += 1
      when 4..6 then diagonal_length -= 1; position += 1
      end
    end
    #binding.pry
    (final.any? { |arr| arr.all? { |x| x == "R" } }) || (final.any? { |arr| arr.all? { |x| x == "B" } })
  end

end
