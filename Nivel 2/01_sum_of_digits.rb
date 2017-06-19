require "test/unit"

class SumDigits
  attr_accessor :value

  def initialize(value)
    @value = value.to_s
  end

  def equation
    (value.to_i > 0) ? result_equation : ''
  end

  private
    def result_equation
      "#{first_equation} = #{second_equation}"
    end

    def value_to_array
      value.chars
    end

    def first_equation
      value_to_array.join(' + ')
    end

    def second_equation
      value_to_array.map(&:to_i).reduce(:+)
    end
end

# Automatic test
class ModulinoTest < Test::Unit::TestCase
  def test_sum_digits

    value = 3433
    assert_equal( '3 + 4 + 3 + 3 = 13', SumDigits.new(value).equation)

    value = 64323
    assert_equal( '6 + 4 + 3 + 2 + 3 = 18', SumDigits.new(value).equation)

    value = 8
    assert_equal( '8 = 8', SumDigits.new(value).equation)

    value = -1
    assert_equal( '', SumDigits.new(value).equation)

  end
end

# Manual Testing
value =  gets.chomp

p SumDigits.new(value).equation


