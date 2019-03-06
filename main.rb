class Board

  attr_accessor :player_1, :player_2
  def initialize
    @board = (0..8).each_with_object([]) { |num, array| array << " "}
    self.display_board
    @player_turn = ""
    @x_or_o_selection_winner = ""
    @x_or_o_selection_loser = ""
    @coin_toss = ""
    @coin_toss_winner = ""
    @coin_selection = ""
    @player_1 = {}
    @player_2 = {}
    @player_turn = ""
    @coordinates = %w[A1 A2 A3 B1 B2 B3 C1 C2 C3]
  end

  def display_board
    row1 = "A |"
    row2 = "B |"
    row3 = "C |"

    @row1 = (0..2).each_with_object([]) { |num, array| array << @board[num] }
    @row2 = (3..5).each_with_object([]) { |num, array| array << @board[num] }
    @row3 = (6..8).each_with_object([]) { |num, array| array << @board[num] }

    @row1.each { |box| row1 << " #{box} |" }
    @row2.each { |box| row2 << " #{box} |" }
    @row3.each { |box| row3 << " #{box} |" }
      
    (0..7).each do |num|
      case
      when num == 0 then puts "    1   2   3"
      when num % 2 != 0 then puts "  -------------"
      when num == 2 then puts row1
      when num == 4 then puts row2
      when num == 6 then puts row3
      end
    end    
  end
  
  def start_game
    puts "Let starts the game!"
    player_turns
  end

  def set_player_details
    coin_options = ["heads", "tails"]

    loop do
      coin_flip_prompt
      @coin_toss = coin_options[rand(2)]
      puts "A coin has been tossed. The result of the coin toss is: #{@coin_toss}"
      
      determine_x_or_o
      break
    end
  end

  def board_position=(position)
    case position
    when "A1"
      @board[0] = @player_turn if @board[0] == " "
    when "A2"
      @board[1] = @player_turn if @board[1] == " "
    when "A3"
      @board[2] = @player_turn if @board[2] == " "
    when "B1"
      @board[3] = @player_turn if @board[3] == " "
    when "B2"
      @board[4] = @player_turn if @board[4] == " "
    when "B3"
      @board[5] = @player_turn if @board[5] == " "
    when "C1"
      @board[6] = @player_turn if @board[6] == " "
    when "C2"
      @board[7] = @player_turn if @board[7] == " "
    when "C3"
      @board[8] = @player_turn if @board[8] == " "
    end
  end

  def coin_flip_prompt
    loop do
      puts "Please Select heads or tails (H/T):"
      @coin_selection = gets.chomp.upcase

      case @coin_selection
      when "H" then puts "Player 1 selected heads!"
      when "T" then puts "Player 1 selected tails!"
      else puts "You didn't select heads or tails."
      end
      
      break if @coin_selection == "H" || @coin_selection == "T"
    end
  end

  def x_or_0_prompt
    x_or_o = ["X", "O"]
    loop do
      puts "#{@coin_toss_winner}- Please select to play as X's or O's (X,O):"

      if @coin_toss_winner == "Player 1"
        @player_1[:x_or_o_selection] = gets.chomp.upcase
        @x_or_o_selection_winner = @player_1[:x_or_o_selection]
        @player_2[:x_or_o_selection] = x_or_o.reject { |n| n == @player_1[:x_or_o_selection] }.pop
        @x_or_o_selection_loser = @player_2[:x_or_o_selection]
      elsif @coin_toss_winner == "Player 2"
        @player_2[:x_or_o_selection] = gets.chomp.upcase
        @x_or_o_selection_winner = @player_2[:x_or_o_selection]
        @player_1[:x_or_o_selection] = x_or_o.reject { |n| n == @player_2[:x_or_o_selection] }.pop
        @x_or_o_selection_loser = @player_1[:x_or_o_selection]
      end
      
      if @x_or_o_selection_winner == "X" || @x_or_o_selection_winner == "O"
        puts "#{@coin_toss_winner} has chosen to play as \"#{@x_or_o_selection_winner}\"" 
        break
      else
        puts "You didn't select 'X' or 'O'. Please make a selection."
      end
    end
  end

  def determine_x_or_o
    case
    when @coin_selection == @coin_toss[0].upcase
      puts "Player 1 has won the coin toss! Player 1 goes first."
      @coin_toss_winner = "Player 1"
      @coin_toss_loser = "Player 2"
      self.x_or_0_prompt
    when @coin_selection != @coin_toss[0].upcase
      puts "Player 1 has lost the coin toss! Player 2 goes first."
      @coin_toss_winner = "Player 2"
      @coin_toss_loser = "Player 1"
      self.x_or_0_prompt
    end
  end

  def player_turns
    (0..8).each do |n|
      if n % 2 == 0
        @player_turn = @x_or_o_selection_winner
        puts "#{@coin_toss_winner}'s turn: Enter the square you would like to place your #{@x_or_o_selection_winner}."
        puts "Use the grid cordinates (eg. enter 'a1' for the top-left corner):"
        coordinates = gets.chomp.upcase
  
        if @coordinates.none? { |position| position == coordinates }
          puts "You didn't enter appropriate cooridinates."
          redo
        elsif @coordinates.one? { |position| position == coordinates }
          if coordinates == "A1" && @board[0] != " "
            puts "You can't select that square, it has already been chosen. Please select again."
            redo
          elsif coordinates == "A2" && @board[1] != " "
            puts "You can't select that square, it has already been chosen. Please select again."
            redo
          elsif coordinates == "A3" && @board[2] != " "
            puts "You can't select that square, it has already been chosen. Please select again."
            redo
          elsif coordinates == "B1" && @board[3] != " "
            puts "You can't select that square, it has already been chosen. Please select again."
            redo
          elsif coordinates == "B2" && @board[4] != " "
            puts "You can't select that square, it has already been chosen. Please select again."
            redo
          elsif coordinates == "B3" && @board[5] != " "
            puts "You can't select that square, it has already been chosen. Please select again."
            redo
          elsif coordinates == "C1" && @board[6] != " "
            puts "You can't select that square, it has already been chosen. Please select again."
            redo
          elsif coordinates == "C2" && @board[7] != " "
            puts "You can't select that square, it has already been chosen. Please select again."
            redo
          elsif coordinates == "C3" && @board[8] != " "
            puts "You can't select that square, it has already been chosen. Please select again."
            redo
          end
          self.board_position = coordinates
        end
        self.display_board
      else
        @player_turn = @x_or_o_selection_loser
        puts "#{@coin_toss_loser}'s turn: Enter the square you would like to place your #{@x_or_o_selection_loser}."
        puts "Use the grid cordinates (eg. enter 'a1' for the top-left corner):"
        coordinates = gets.chomp.upcase
        
        if @coordinates.none? { |position| position == coordinates }
          puts "You didn't enter appropriate cooridinates."
          redo 
        elsif @coordinates.one? { |position| position == coordinates }
          if coordinates == "A1" && @board[0] != " "
            puts "You can't select that square, it has already been chosen. Please select again."
            redo
          elsif coordinates == "A2" && @board[1] != " "
            puts "You can't select that square, it has already been chosen. Please select again."
            redo
          elsif coordinates == "A3" && @board[2] != " "
            puts "You can't select that square, it has already been chosen. Please select again."
            redo
          elsif coordinates == "B1" && @board[3] != " "
            puts "You can't select that square, it has already been chosen. Please select again."
            redo
          elsif coordinates == "B2" && @board[4] != " "
            puts "You can't select that square, it has already been chosen. Please select again."
            redo
          elsif coordinates == "B3" && @board[5] != " "
            puts "You can't select that square, it has already been chosen. Please select again."
            redo
          elsif coordinates == "C1" && @board[6] != " "
            puts "You can't select that square, it has already been chosen. Please select again."
            redo
          elsif coordinates == "C2" && @board[7] != " "
            puts "You can't select that square, it has already been chosen. Please select again."
            redo
          elsif coordinates == "C3" && @board[8] != " "
            puts "You can't select that square, it has already been chosen. Please select again."
            redo
          end
          self.board_position = coordinates
        end
        self.display_board
      end
    end
  end

  protected
  def board
    @board
  end
end

board1 = Board.new

board1.set_player_details
board1.start_game

p board1.player_1
p board1.player_2