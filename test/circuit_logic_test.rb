require 'circuit_logic'

module CircuitLogic
  class TestLogic < Test::Unit::TestCase
    def setup
      @on = On.new
      @off = Off.new
    end
  
    def assert_on(logic_unit)
      assert logic_unit.on?
    end
  
    def assert_off(logic_unit)
      flunk "Expected #{logic_unit} to be off." if logic_unit.on?
    end
  
    def test_on_is_on
      assert_on @on
    end
  
    def test_off_is_off
      assert_off @off
    end
  
    def test_and
      assert_off And.new(@off , @off)
      assert_off And.new(@on  , @off)
      assert_off And.new(@off , @on)
      assert_on  And.new(@on  , @on)
    end
  
    def test_or
      assert_off Or.new(@off , @off)
      assert_on  Or.new(@on  , @off)
      assert_on  Or.new(@off , @on)
      assert_on  Or.new(@on  , @on)
    end
  
    def test_xor
      assert_off Xor.new(@off , @off)
      assert_on  Xor.new(@on  , @off)
      assert_on  Xor.new(@off , @on)
      assert_off Xor.new(@on  , @on)
    end
  
    def test_not
      assert_off Not.new(@on)
      assert_on  Not.new(@off)
    end
  
    def test_light_is_input
      assert_on  Light.new(@on)
      assert_off Light.new(@off)
    end
  
    def test_first_example
      light = Light.new Or.new(@on, @off)
      assert_on light
    end
  
    def test_second_example
      light = Light.new(Xor.new(And.new(@on, @off), Not.new(@on)))
      assert_off light
    end
  
    def test_third_example
      light = Light.new(Xor.new(Or.new(@on, @off), Xor.new(@on,@on)))
      assert_on light
    end
  
    def test_on_equals_on
      assert_equal On.new, On.new
    end
  
    def test_off_equals_off
      assert_equal Off.new, Off.new
    end
  
    def test_on_not_equal_off
      refute_equal On.new, Off.new
      refute_equal Off.new, On.new
    end
  
    def test_other_circuit_logics_know_equality
      assert_equal On.new, And.new(@on, @on)
      refute_equal On.new, Off.new
      assert_equal Off.new, And.new(@off, @off)
      assert_equal And.new(@on, @on),  On.new
      assert_equal Or.new(@on, @on),   On.new
      assert_equal Xor.new(@on, @on),  Off.new
      assert_equal Not.new(@on),       Off.new
      assert_equal Light.new(@on),     On.new
      refute_equal Light.new(@on), Light.new(@off)
    end
    
  end
end
