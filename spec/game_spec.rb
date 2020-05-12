require '../lib/game.rb'

describe Game do

  before(:each) { @game = Game.new }

  describe("#get_signs") do
    it "assigns markers" do
      double(:p1.marker => "R")
      expect(:p2.marker).to eq("B")
    end
  end

  describe("#switch_player") do
    it "returns opposite player sign" do
      double(:current_player => "R")
      expect(switch_player).to eq("B")
    end
  end

  describe("#game_over?") do
    it "returns true if connect four" do
      expect(game_over?).to eq true
    end
  end

end
