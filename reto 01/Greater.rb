require "test/unit"

class Greater
  attr_accessor :values

  def initialize(values)
    @values = values
  end

  def max
    values.max
  end
end

# Automatic test
class ModulinoTest < Test::Unit::TestCase
  def test_greater

    values = [27, 3002]
    assert_equal( 3002, Greater.new(values).max)

    values = [3002, 28]
    assert_equal( 3002, Greater.new(values).max)

    values = [3002, 3002]
    assert_equal( 3002, Greater.new(values).max)

    values = [-500, -101]
    assert_equal( -101, Greater.new(values).max)

  end
end

# Manual Testing
values = []
(1..2).each do
  values << gets.chomp
end

p Greater.new(values).max


