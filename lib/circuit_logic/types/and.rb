require 'circuit_logic/logic_equality'

module CircuitLogic
  class And
    include LogicEquality
  
    def initialize(left, right)
      @left, @right = left, right
    end
  
    def on?
      @left.on? && @right.on?
    end
  end
end
