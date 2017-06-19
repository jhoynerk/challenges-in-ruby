require "test/unit"

class PrimeFactors
  require 'prime'

  attr_accessor :value

  def initialize(value)
    @value = value
  end

  def list
    Prime.prime_division(value).map { |v| humanize_array.call(v) }.join(' ') unless value.zero?
  end

  private
    def humanize_array
      return lambda { |v| (1..v.last).map{ v.first } }
    end

end

# Automatic test
class ModulinoTest < Test::Unit::TestCase
  def test_prime_factoris
    value = 4
    assert_equal( '2 2', PrimeFactors.new(value).list)

    value = 24
    assert_equal( '2 2 2 3', PrimeFactors.new(value).list)

    value = 59
    assert_equal( '59', PrimeFactors.new(value).list)

    value = 1234567890
    assert_equal( '2 3 3 5 3607 3803', PrimeFactors.new(value).list)

    value = 987654321098765
    assert_equal( '5 233 1279 662839679', PrimeFactors.new(value).list)
  end
end

# Manual Testing
value = gets.chomp.to_i

p PrimeFactors.new(value).list


