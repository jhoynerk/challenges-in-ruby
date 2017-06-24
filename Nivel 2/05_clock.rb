require "test/unit"

class Clock
  attr_accessor :seconds, :clock, :total_sum_leds


  def initialize(seconds)
    @seconds = seconds
    @clock = { hours: 0, minutes: 0, seconds: 0}
  end

  def sum_leds_on
    hours_minutes_seconds.each_with_index do |time, key|
      sum_led_on(time, key) if time > 0
    end
  end

  def sum_led_on(time, key)
    seconds_to_time = all_seconds(time, key)
    (0..seconds_to_time).each do |second|
      p second
    end
  end

  def all_seconds(time, key)
    time * ((key != 0) ? 60 : 1)
  end

  def generate_clock(time)
    time.map { SevenSegment.new(0).total_leds }
  end

  def hours_minutes_seconds
    formatted_duration.each_with_index do |time, index|
      clock[clock.key(index)] = time
    end
  end

  def formatted_duration
    [60,60].reduce([seconds]) { |m,o| m.unshift(m.shift.divmod(o)).flatten }
  end

  def sum_clocks_in_secod
    @clock.reduce(:+)
  end
end

class SevenSegment
  LED_LIGHTS = [ 6, 2, 5, 5, 4, 5, 6, 3, 7, 5 ]
  def initialize(number)
    @number = number
  end

  def total_leds
    SevenSegment::LED_LIGHTS[@number]
  end
end

# Automatic test
class ModulinoTest < Test::Unit::TestCase
  def test_clock
    seconds = 0
    #assert_equal( 36 , Clock.new(seconds).sum_leds_on)
    #assert_equal( 36 , Clock.new(seconds).sum_leds_on)
  end
end

# Manual Testing
p Clock.new(119).sum_leds_on
