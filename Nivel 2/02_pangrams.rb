require "test/unit"

class Pangrams
  attr_accessor :sentence

  def initialize(sentence)
    @sentence = sentence
  end

  def is_pangrams?
    ('a'..'z').all? { |char| sentence.downcase.include? (char) }
  end

  def humanize_response
    ( is_pangrams? ) ? 'SI' : 'NO'
  end

end

# Automatic test
class ModulinoTest < Test::Unit::TestCase
  def test_pangrams

    value = 'abcdefGHIJKLMNopqrstuvwxyz'
    assert_equal( 'SI' , Pangrams.new(value).humanize_response)

    value = 'abcdefghijklwnopqrstuvwxyz'
    assert_equal( 'NO', Pangrams.new(value).humanize_response)

    value = 'Este es un texto de ejemplo'
    assert_equal( 'NO', Pangrams.new(value).humanize_response)

    value = 'The quick brown fox jumps over the lazy dog'
    assert_equal( 'SI', Pangrams.new(value).humanize_response)

    value = 'El veloz murciélago hindú comía feliz cardillo y kiwi. La cigüeña tocaba el saxofón detrás del palenque de paja'
    assert_equal( 'SI', Pangrams.new(value).humanize_response)

    value = 'El viejo Señor Gómez pedía queso, kiwi y habas, pero le ha tocado un saxo.'
    assert_equal( 'NO', Pangrams.new(value).humanize_response)

    value = 'Quiere la boca exhausta vid, kiwi, piña y fugaz jamón.'
    assert_equal( 'SI', Pangrams.new(value).humanize_response)

  end
end

# Manual Testing
value =  gets.chomp

p Pangrams.new(value).humanize_response


