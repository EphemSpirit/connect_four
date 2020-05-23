require '../lib/player.rb'
require 'stringio'

describe Player do

  describe("#get_marker") do
    player = Player.new
    it "assigns player marker" do
      allow($stdin).to receive(:gets).and_return("R")
      player.marker = $stdin.gets
      expect(player.get_marker).to be == "R\n"
    end
  end
end
