require "../lib/board.rb"

describe Board do

  before(:each) { @board = Board.new.make_board }

  describe("#make_board") do

    it "makes six rows" do
      expect(@board.length).to eq(6)
    end

    it "makes 7 columns" do
      expect(@board[0].length).to eq(7)
    end

  end

  describe("#valid_move?") do

    it "returns true is space is empty" do
      double(:choice => 2, :board[5][@choice] => " ")
      expect(valid_move?(@choice)).to be_valid_move
    end

    it "returns false is space taken" do
      double(:choice => 2, :board[5][@choice] => "R")
      expect(valid_move?(@choice)).not_to be_valid_move
    end

  end

  describe("#mark_square") do

    it "marks chosen square with player symbol" do
      double(:choice => 2, :board[5][@choice] => " ", :player.marker => "R")
      expect(mark_square(2)).to eq(:board[5][@choice] => "R")
      end

  end

  describe("#winner?") do

    it "returns true when 4 like symbols connected" do
      double(:board[2] => ["R", "R", "R", "R", " ", " ", " ", " "])
      expect(winner(:board)).to be_winner
    end

  end

  describe("#find_horizontal") do

    it "returns true if 4 horizontal" do
      double(:board[2] => ["R", "R", "R", "R", " ", " ", " ", " "])
      expect(find_horizontal(:board)).to eq true
    end

  end

  describe("#find_vertical") do
    
    it "returns true if 4 vertical" do
      @board.each do |row|
        row[2] = "R"
      end
      expect(find_vertical(@board)).to eq true
    end

  end


end
