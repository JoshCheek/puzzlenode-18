module CircuitLogic
  class Parser
    class LightCircuit
      
      NODES = Hash.new { |h, node| raise "You haven't implemented NODES[#{node.inspect}] yet" }
      NODES['1'] = Proc.new { true }
      NODES['0'] = Proc.new { false }
      NODES['@'] = Proc.new { |(input)| input }
      NODES['N'] = Proc.new { |(input)| !input }
      NODES['X'] = Proc.new { |(left, right)| left ^ right }
      NODES['A'] = Proc.new { |(left, right)| left && right }
      NODES['O'] = Proc.new { |(left, right)| left || right }

      def on?
        @tree.reverse_reduce { |node, inputs| NODES[node][inputs] }
      end
    
      def initialize(light_y, light_x, board)
        @tree = Tree.new light_y, light_x, board
      end
      
      def to_s
        if on? then 'on' else 'off' end
      end

    end
  end
end
