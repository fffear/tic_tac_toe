require './main.rb'

describe Board do
  describe "#victory_conditions." do    
    before(:each) do
      @game = Board.new
      @board1 = double('board')
    end

    def create_stub(predefined_value)
      allow(@board1).to receive(:board) { predefined_value }
      @game.board = @board1.board
    end

    # column victory scenarios
    it "returns true when the left column boxes are all the same marker (X's)." do
      create_stub(["X", " ", " ", "X", " ", " ", "X", " ", " "])
      expect(@game.victory_conditions).to eq(true)
    end

    it "returns true when the left column boxes are all the same marker (O's)." do
      create_stub(["O", " ", " ", "O", " ", " ", "O", " ", " "])
      expect(@game.victory_conditions).to eq(true)
    end

    it "returns true when the middle column boxes are all the same marker (X's)." do
      create_stub([" ", "X", " ", " ", "X", " ", " ", "X", " "])
      expect(@game.victory_conditions).to eq(true)
    end

    it "returns true when the middle column boxes are all the same marker (O's)." do
      create_stub([" ", "O", " ", " ", "O", " ", " ", "O", " "])
      expect(@game.victory_conditions).to eq(true)
    end

    it "returns true when the right column boxes are all the same marker (X's)." do
      create_stub([" ", "", "X", " ", " ", "X", " ", " ", "X"])
      expect(@game.victory_conditions).to eq(true)
    end

    it "returns true when the right column boxes are all the same marker (O's)." do
      create_stub([" ", " ", "O", " ", " ", "O", " ", " ", "O"])
      expect(@game.victory_conditions).to eq(true)
    end

    # row victory scenarios
    it "returns true when the bottom row boxes are all the same marker (X's)." do
      create_stub(["X", "X", "X", " ", " ", " ", " ", " ", " "])
      expect(@game.victory_conditions).to eq(true)
    end

    it "returns true when the borrom row boxes are all the same marker (O's)." do
      create_stub(["O", "O", "O", " ", " ", " ", " ", " ", " "])
      expect(@game.victory_conditions).to eq(true)
    end

    it "returns true when the middle row boxes are all the same marker (X's)." do
      create_stub([" ", " ", " ", "X", "X", "X", " ", " ", " "])
      expect(@game.victory_conditions).to eq(true)
    end

    it "returns true when the middle row boxes are all the same marker (O's)." do
      create_stub([" ", " ", " ", "O", "O", "O", " ", " ", " "])
      expect(@game.victory_conditions).to eq(true)
    end

    it "returns true when the top row boxes are all the same marker (X's)." do
      create_stub([" ", "", " ", " ", " ", " ", "X", "X", "X"])
      expect(@game.victory_conditions).to eq(true)
    end

    it "returns true when the right column boxes are all the same marker (O's)." do
      create_stub([" ", " ", " ", " ", " ", " ", "O", "O", "O"])
      expect(@game.victory_conditions).to eq(true)
    end

    # diagonal victory scenario
    it "returns true when the diagonal from the bottom left to the top right corner's are all the same marker (X's)." do
      create_stub(["X", "", " ", " ", "X", " ", " ", " ", "X"])
      expect(@game.victory_conditions).to eq(true)
    end

    it "returns true when the diagonal from the bottom left to the top right corner's are all the same marker (O's)." do
      create_stub(["O", " ", " ", " ", "O", " ", " ", " ", "O"])
      expect(@game.victory_conditions).to eq(true)
    end

    it "returns true when the diagonal from the bottom right to the top left corner's are all the same marker (X's)." do
      create_stub([" ", "", "X", " ", "X", " ", "X", " ", " "])
      expect(@game.victory_conditions).to eq(true)
    end

    it "returns true when the diagonal from the bottom right to the top left corner's are all the same marker (O's)." do
      create_stub([" ", " ", "O", " ", "O", " ", "O", " ", " "])
      expect(@game.victory_conditions).to eq(true)
    end

    # victory doesn't trigger if boxes are empty
    it "returns nil when 3 in a row, column or diagonally are empty." do
      create_stub([" ", " ", " ", " ", " ", " ", " ", " ", " "])
      expect(@game.victory_conditions).to eq(nil)
    end
  end

  describe "#start_game" do
    it "should run player_turns method from start_game" do
      @game = Board.new
      @board1 = double('board')
      allow(@game).to receive(:display_board) {nil}
      allow(@game).to receive(:player_turns) {"I am running"}
      @game.start_game =~ /I am running/
    end
  end
end