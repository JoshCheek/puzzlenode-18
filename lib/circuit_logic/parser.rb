require 'circuit_logic/parser/light_circuit'
require 'circuit_logic/parser/tree'

module CircuitLogic
  class Parser
    attr_reader :lights
  
    def self.parse(to_parse)
      Parser.new(to_parse).results
    end
  
    def self.convert_string_to_board(to_parse)
      lines = to_parse.split("\n")
      lines.map { |line| line.split(//) }
    end
  
    def initialize(to_parse)
      @to_parse = to_parse
    end
  
    def results
      @board = Parser.convert_string_to_board(@to_parse)
      find_lights
      lights
    end
        
    def find_lights
      @lights = []
      @board.each_with_index do |row, y|
        row.each_with_index do |col, x|
          @lights << LightCircuit.new(y, x, @board) if light?(col)
        end
      end
    end
    
    def light?(string)
      string == "@"
    end
  end
end
