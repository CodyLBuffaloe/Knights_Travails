class Knight
#shows the shortest path from beginning coordinates on board to end, outputting all squares touched on the way
  def knight_moves

  end
end

class Board
  def initialize
    @board = Array.new(8){Array.new(8)}
    @board.each do |e|
      puts "#{e}"
    end
  end
end

b = Board.new
#Build a board and a knight
#treat all possible Knight moves as children in a tree NO MOVES OFFBOARD!
#Which search algorithm is best for this? What is good at going through a potentially infinite series quickly?