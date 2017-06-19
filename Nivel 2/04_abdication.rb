require "test/unit"

class Abdication
  attr_accessor :names, :possible_names

  def initialize(list_names)
    @names = {}
    names_counter(list_names)
  end

  def get_number_to(possible_names)
    counter = ''
    possible_names.split(' ').each do |n|
      find_or_create(n)
      counter += "#{names[n]}\n"
    end
    return counter
  end

  private
    def names_counter(list_names)
      list_names.split(' ').each do |n|
        find_or_create(n)
      end
    end

    def find_or_create(name)
      names[name] = names[name].nil? ? 1 : count_by_name(name)
    end

    def count_by_name(name)
      names[name] + 1
    end
end

# Automatic test
class ModulinoTest < Test::Unit::TestCase
  def test_abdication

    list_names = 'Felipe Carlos Felipe Felipe Felipe Carlos Felipe Carlos Alfonso Alfonso JuanCarlos'
    possible_names = 'Felipe Leonor Felipe'

    assert_equal( "6\n1\n7\n" , Abdication.new(list_names).get_number_to(possible_names))

    list_names = 'Carlos Isabel Carlos Jorge Jorge Jorge Jorge Guillermo Victoria Jorge Jorge Isabel'
    possible_names = 'Carlos Guillermo Jorge'

    assert_equal( "3\n2\n7\n" , Abdication.new(list_names).get_number_to(possible_names))
  end
end

# Manual Testing
begin
  quantity = gets.chomp
  if (quantity != '0')
    list_names = gets.chomp
    quantity = gets.chomp
    possible_names = gets.chomp
    print Abdication.new(list_names).get_number_to(possible_names)
  end
end while quantity != '0'
