require "test/unit"

class Potitos
  attr_accessor :values, :acceptable, :unacceptable

  def initialize(values)
    @values = values
    @acceptable = []
    @unacceptable = []
    search_acceptable
  end

  def search_unacceptable
    (@unacceptable.flatten - @acceptable.flatten).join(' ')
  end

  def search_acceptable
    @values.each do |foods|
      @acceptable << foods.split(' ')[1..-2] if foods[0..1] == 'SI'
      @unacceptable << foods.split(' ')[1..-2] if foods[0..1] == 'NO'
    end
  end
end

# Automatic test
class ModulinoTest < Test::Unit::TestCase
  def test_potitos

    values = ['SI: patata maiz tomate FIN', 'NO: patata puerro guisantes pollo FIN', 'SI: tomate zanahoria puerro pollo calabacin arroz FIN']
    assert_equal( 'guisantes' , Potitos.new(values).search_unacceptable)

    values = ['SI: tomate zanahoria pollo calabacin arroz FIN', 'NO: tomate ternera puerro FIN']
    assert_equal( 'ternera puerro', Potitos.new(values).search_unacceptable)
  end
end


# Manual Testing
quantity = gets.chomp
values = []
(1..quantity.to_i).each do ||
  values << gets.chomp
end

p Potitos.new(values).search_unacceptable


