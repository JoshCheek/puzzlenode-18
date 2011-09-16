require 'circuit_logic'

module CircuitLogic
  class Parser
    class TestParserTree < Test::Unit::TestCase
      def board1
        string = "0-------------|\n"               +
                 "              |\n"               +
                 "              O-----------@\n"   +
                 "1-------------|\n"
        Parser.convert_string_to_board(string)
      end
  
      def test_board1_is_on
        tree = Tree.new(2, 26, board1)
        assert_equal "@", tree.node
        assert_equal [:left], tree.directions
      
        tree = tree.children.first
        assert_equal "O", tree.node
        assert_equal [:up, :down], tree.directions
      
        tree1, tree2 = tree.children
        assert_equal "0", tree1.node
        assert_equal [], tree1.directions
      
        assert_equal "1", tree2.node
        assert_equal [], tree2.directions
      end
    end
  end
end
