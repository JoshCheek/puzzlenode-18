require 'circuit_logic/logic_equality'

module CircuitLogic
  class Off
    include LogicEquality
  
    def on?
      false
    end  
  end
end
