module CircuitLogic
  module LogicEquality
    def ==(other)
      other.on? == on?
    end
  end
end