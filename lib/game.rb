require_relative "board"
require_relative "player"

class Game

  @@game_over = false

  attr_reader :current_player, :other_player
  attr_accessor :choice, :marker

  def initialize(p1, p2, board = Board.new)
    @p1 = p1
    @p2 = p2
    @board = board
    @current_player = @p1
    @other_player = @p2
  end

  def get_signs
    @p1.get_marker
    if  @p1.marker == "R"
      @p2.marker = "B"
    else
      @p2.marker = "R"
    end
  end

  def play_round
    get_signs
    @board.make_board
    @board.print_board

    until @@game_over
      puts "#{@current_player.marker}, your turn!"
      @choice = gets.chomp.to_i
      if @board.valid_move?(@choice)
        @board.mark_square(@current_player, @choice)
        @board.make_board
        game_over?
        @board.draw?(@board)
        switch_player
        @board.print_board
      end
    end
  end

  def switch_player
    @current_player, @other_player = @other_player, @current_player
  end

  def game_over?
    @@game_over = true if @board.winner?
  end

end

p1 = Player.new
p2 = Player.new
game = Game.new(p1, p2)
game.play_round
