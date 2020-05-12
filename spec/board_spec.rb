require "../lib/board.rb"

describe Board do

  before(:each) { @board = Board.new }

  describe("#make_board") do
    it "returns an 7x6 gamespace" do
      expect(@board.make_board).to eq(Array.new(8){ Array.new(8, " ") })
    end
  end

  describe("#valid_move?") do
    it "returns true is space is empty" do
      double(:choice => 2, :board[5][choice]=> [" "])
      expect(valid_move?(2, 4)).to be_valid_move
    end

    it "returns false is space taken" do
      double(:choice => 2, :board[5][choice] => ["R"])
      expect(valid_move?(2)).not_to be_valid_move
    end
  end

  describe("#mark_square") do
    it "marks chosen square with player symbol" do
      double(:choice => 2, :board[5][2] => [" "])
      expect(mark_square(2)).to eq(:board[5][2] => ["R"])
      end
    end
  end

  describe("#winner?") do
    it "returns true when 4 like symbols connected" do
      double(:board[2] => ["R", "R", "R", "R", " ", " ", " ", " "])
      expect(winner(:board)).to be_winner
    end
  end
