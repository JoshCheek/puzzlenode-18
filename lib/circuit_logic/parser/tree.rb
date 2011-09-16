module CircuitLogic
  class Parser
    class Tree
      attr_reader :node, :parent_direction, :y, :x, :board
    
      def initialize(y,x,board,parent_direction=:right)
        @y,@x,@board = y, x, board
        @node = @board[@y][@x]
        @parent_direction = parent_direction
      end
    
      def directions
        available_directions - [parent_direction]
      end
    
      def available_directions
        to_return = []
        to_return << :left  if can_go_left?
        to_return << :up    if can_go_up?
        to_return << :right if can_go_right?
        to_return << :down  if can_go_down?
        to_return
      end
    
      def children
        directions.map do |direction| 
          tree = Tree.new y_for(direction), x_for(direction), board, opposite(direction)
          tree = tree.children.first while tree.wire?
          tree
        end
      end
    
      def reverse_reduce(&block)
        inputs = children.map { |child| child.reverse_reduce(&block) }
        block.call node, inputs
      end
    
      def wire?
        node == '-' || node == '|'
      end
    
      def y_for(direction)
        return y + 1 if direction == :down
        return y - 1 if direction == :up
        y
      end
    
      def x_for(direction)
        return x + 1 if direction == :right
        return x - 1 if direction == :left
        x
      end
    
      def opposite(direction)
        { :left  => :right,
          :right => :left,
          :up    => :down,
          :down  => :up }[direction]
      end
    
      def can_go_left?
        x != 0 && empty_board?(y, x-1)
      end
    
      def can_go_up?
        y != 0 && empty_board?(y-1, x)
      end
    
      def can_go_right?
        x+1 < board[y].length && empty_board?(y, x+1)
      end
    
      def can_go_down?
        y+1 < board.length && empty_board?(y+1, x)
      end
    
      def empty_board?(y, x)
        board[y] && board[y][x] && board[y][x] != ' '
      end
    end
  end
end