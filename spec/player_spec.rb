require '../lib/player.rb'

describe Player do

  describe("#get_marker") do
    player = Player.new
    it "assigns player marker" do
      double(:player_marker => "R")
      expect(player.get_marker).to eq("R")
    end
  end
end
