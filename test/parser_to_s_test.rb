require 'circuit_logic'

module CircuitLogic
  class Parser
    class TestParser < Test::Unit::TestCase
      def circuit
        LightCircuit.new 0, 0, ""
      end
    
      def test_on_is_on
        c = LightCircuit.new(0, 1, Parser.convert_string_to_board('1@'))
        assert_equal 'on', c.to_s
      end
    
      def test_off_is_off
        c = LightCircuit.new(0, 1, Parser.convert_string_to_board('0@'))
        assert_equal 'off', c.to_s
      end
    end
  end
end
