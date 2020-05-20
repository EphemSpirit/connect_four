require '../lib/game.rb'
require '../lib/player.rb'
require '../lib/board.rb'

describe Game do

  before(:each) { @board = Board.new }
  before(:each) { @player1 = Player.new }
  before(:each) { @player2 = Player.new }
  before(:each) { @game = Game.new(@player1, @player2) }

  describe("#switch_player") do
    it "returns opposite player sign" do
      current_player = @player1
      current_player.marker = "R"
      expect(@game.switch_player).to eq("B")
    end
  end

  describe("#game_over?") do
    it "returns true if connect four" do
      @board.board[2] = ["R", "R", "R", "R", " ", " ", " ", " "]
      expect(@game.game_over?).to eq true
    end
  end

end
