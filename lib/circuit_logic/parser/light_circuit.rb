require 'circuit_logic/types'

module CircuitLogic
  class Parser
    class LightCircuit
      include LogicEquality

      def on?
        @tree.reverse_reduce { |node, inputs|
          case node
          when '@' then Light.new(*inputs)
          when 'A' then And.new(*inputs)
          when 'O' then Or.new(*inputs)
          when 'X' then Xor.new(*inputs)
          when 'N' then Not.new(*inputs)
          when '1' then On.new
          when '0' then Off.new
          else raise "NODE IS #{node.inspect}"
          end
        }.on?
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
