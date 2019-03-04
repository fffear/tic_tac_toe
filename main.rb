class Board
  def initialize
    @board = (0..8).each_with_object([]) { |num, array| array << " "}
    self.display_board
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
  
  def board_position=(position)
    case position
    when "a1" then @board[0] = "X"
    when "a2" then @board[1] = "X"
    when "a3" then @board[2] = "X"
    when "b1" then @board[3] = "X"
    when "b2" then @board[4] = "X"
    when "b3" then @board[5] = "X"
    when "c1" then @board[6] = "X"
    when "c2" then @board[7] = "X"
    when "c3" then @board[8] = "X"
    end
  end

  protected
  def board
    @board
  end

end

board1 = Board.new

board1.board_position = "c3"
board1.display_board