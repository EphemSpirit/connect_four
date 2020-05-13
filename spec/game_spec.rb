require '../lib/game.rb'

describe Game do

  before(:each) { @game = Game.new }

  describe("#switch_player") do
    it "returns opposite player sign" do
      double(:current_player.marker => "R")
      expect(switch_player).to eq("B")
    end
  end

  describe("#game_over?") do
    it "returns true if connect four" do
      double(:board[2] => ["R", "R", "R", "R", " ", " ", " ", " "])
      expect(game_over?).to eq true
    end
  end

end
