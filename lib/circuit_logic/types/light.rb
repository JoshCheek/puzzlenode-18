require 'circuit_logic/logic_equality'

module CircuitLogic
  class Light
    include LogicEquality
  
    def initialize(input)
      @input = input
    end
  
    def on?
      @input.on?
    end
  end
end
