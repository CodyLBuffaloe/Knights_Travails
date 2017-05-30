class Knight
  attr_accessor :current_position, :previous_move
  def initialize(current_position, previous_move = nil)
    @current_position = current_position
    @previous_move = previous_move
  end
  def next_move
    avail_moves = []
    x = [2, 2, 1, -1, -2, -2, -1, 1]
    y = [1, -1, -2, -2, -1, 1, 2, 2]
    8.times do
      start = @current_position.clone
      start[0] += x.shift
      start[1] += y.shift
      if @previous_move == nil
        avail_moves << start unless off_board(start)
      elsif @previous_move.current_position != start
        avail_moves << start unless off_board(start)
      end
    end
    avail_moves
  end
  def off_board(position)
    if (0..7).include?(position[0]) && (0..7).include?(position[1])
      return false
    else
      return true
    end
  end
end
#shows the shortest path from beginning coordinates on board to end, outputting all squares touched on the way
def knight_moves(starting_position, ending_position)
  this_guy = Knight.new(starting_position)
  queue = []
  queue << this_guy
  until this_guy.current_position == ending_position || queue.empty?
    this_guy = queue.shift
    this_guy.next_move.each do |hop|
      next_up = Knight.new(hop, this_guy)
      queue << next_up
    end
  end

  course = []
  steps = 0
  until this_guy == nil
    course << this_guy.current_position
    steps += 1
    this_guy = this_guy.previous_move
  end

  puts "You made it in #{steps} moves! Here's your path:"
  until course.empty?
    puts course.pop.to_s
  end
end

knight_moves([0,3],[3,3])

knight_moves([0,0],[0,7])





#Build a board and a knight
#treat all possible Knight moves as children in a tree NO MOVES OFFBOARD!
#Which search algorithm is best for this? What is good at going through a potentially infinite series quickly?

=begin
Conceptualize moving through arrays, instead of a board. You are traversing two arrays down and one subscript over in order to find
ending_position. Then start thinking of it as a board, with vertical and lateral moves you'll need to get from place to place.
=end

=begin
How to go about treating all indicies as nodes in a tree?
-@knight starts @ @board[0][1]
-Tree is instance level
-How should I traverse through arrays/ traverse subscripts?
- Will need to somehow communicate can't move past [array][7], since out of bounds.
=end