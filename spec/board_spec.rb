require "../lib/board.rb"
require "../lib/player.rb"

describe Board do

  before(:each) { @board = Board.new }

  describe("#make_board") do

    it "makes six rows" do
      expect(@board.board.length).to eq(6)
    end

    it "makes 7 columns" do
      expect(@board.board[0].length).to eq(7)
    end

  end

  describe("#valid_move?") do

    it "returns true if column not full" do
      @board.board[5][2] = " "
      expect(@board.valid_move?(3)).to eq true
    end

    it "returns false is column full" do
      @board.board[0][2] = "R"
      expect(@board.valid_move?(3)).to_not eq true
    end

    it "returns false if choice out of range" do
      expect(@board.valid_move?(8)).to_not eq true
    end

  end

  describe("#mark_square") do

    it "marks chosen square with player symbol" do
      @player = Player.new
      @player.marker = "R"
      expect(@board.mark_square(@player, 2)).to eq(:board[5][2] => "R")
    end

  end

  describe("#winner?") do

    xit "returns true when 4 like symbols connected" do
      double(:board[2] => ["R", "R", "R", "R", " ", " ", " ", " "])
      expect(@board.winner?(@board)).to be_winner
    end

  end

  describe("#find_horizontal") do

    it "returns true if 4 horizontal" do
      @board.board[2] = ["R", "R", "R", "R", " ", " ", " "]
      expect(@board.find_horizontal(:board)).to eq true
    end

  end

  describe("#find_vertical") do

    it "returns true if 4 vertical" do
      @board.board.each do |row|
        row[2] = "R"
      end

      expect(@board.find_vertical(@board)).to eq true
    end

  end

  describe("#find_diagonals") do

    xit "returns true if a diagonal match"
      @board = [[" ", " ", " ", " ", " ", " ", " "],
                [" ", " ", " ", " ", " ", " ", " "],
                [" ", " ", " ", " ", " ", " ", "R"],
                [" ", " ", " ", " ", " ", "R", " "],
                [" ", " ", " ", " ", "R", " ", " "],
                [" ", " ", " ", "R", " ", " ", " "]]
      expect(@board.find_diagonals(@board)).to eq true
    end
end
