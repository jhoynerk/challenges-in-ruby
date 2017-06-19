require "test/unit"

class IrreducibleFraction
  attr_accessor :value

  def initialize(value)
    @value = value.to_s
  end

  def to_fraction
    Rational(value).to_s
  end
end

# Automatic test
class ModulinoTest < Test::Unit::TestCase
  def test_irreducible_fraction
    value = 0.25
    assert_equal( '1/4', IrreducibleFraction.new(value).to_fraction)

    value = 0.5
    assert_equal( '1/2', IrreducibleFraction.new(value).to_fraction)

    value = 0.125
    assert_equal( '1/8', IrreducibleFraction.new(value).to_fraction)

    value = 0.002
    assert_equal( '1/500', IrreducibleFraction.new(value).to_fraction)

    value = 0.376
    assert_equal( '47/125', IrreducibleFraction.new(value).to_fraction)
  end
end

# Manual Testing
value = gets.chomp
p IrreducibleFraction.new(value).to_fraction


