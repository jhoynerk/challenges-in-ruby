require "test/unit"

class LeastCommonMultiple
  attr_accessor :values

  def initialize(values)
    @values = values
  end

  def least_divisible
    @values.reduce(:lcm)
  end

end


# Automatic test
class ModulinoTest < Test::Unit::TestCase
  def test_least_common_multiple
    values = [3, 7, 2]
    assert_equal( 42, LeastCommonMultiple.new(values).least_divisible)

    values = [12, 24, 28]
    assert_equal( 168, LeastCommonMultiple.new(values).least_divisible)

    values = [12, 24, 48]
    assert_equal( 48, LeastCommonMultiple.new(values).least_divisible)

    values = [1234, 1326, 888]
    assert_equal( 121085016, LeastCommonMultiple.new(values).least_divisible)

    values = [12345, 54321, 55555]
    assert_equal( 2483651996565, LeastCommonMultiple.new(values).least_divisible)
  end
end

# Manual Testing
values = []
(1..3).each do
  values << gets.chomp.to_i
end

p LeastCommonMultiple.new(values).least_divisible


