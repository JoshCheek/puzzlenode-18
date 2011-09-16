require 'circuit_logic/logic_equality'

module CircuitLogic
  class On
    include LogicEquality
  
    def on?
      true
    end
  end
end
