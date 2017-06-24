require "test/unit"

class Clock
  attr_accessor :seconds, :time, :total_sum_leds, :clock, :total

  def initialize(seconds)
    @seconds = seconds
    @time = { hours: 0, minutes: 0, seconds: 0}
    @clock = generate_clock('000000')
    @total = total_clock_points
  end

  def sum_leds_on
    hours_minutes_seconds.reverse.each_with_index do |time, key|
      sum_led_on(time, key) if time > 0
    end
    total
  end

  def sum_led_on(time, key)
    seconds_to_time = all_seconds(time, key)
    (1..seconds_to_time).each do |second|
      add_second_to_clock
      @total += total_clock_points
    end
  end

  def all_seconds(time, key)
    time * ((key != 0) ? 60 : 1)
  end

  def generate_clock(number)
    number.chars.map { |n| SevenSegment.new(n) }
  end

  def total_clock_points
    @clock.map { |c| c.total_leds }.reduce(:+)
  end

  def hours_minutes_seconds
    formatted_duration.each_with_index do |t, index|
      time[time.key(index)] = t
    end
  end

  def add_second_to_clock
    number = clock_to_i + 1
    number = number.to_s.rjust(6, '0')
    @clock = generate_clock(number)
  end

  def clock_to_i
    @clock.map { |c| c.number }.join('').to_i
  end

  def formatted_duration
    [60,60].reduce([seconds]) { |m,o| m.unshift(m.shift.divmod(o)).flatten }
  end
end

class SevenSegment
  attr_accessor :number

  LED_LIGHTS = [ 6, 2, 5, 5, 4, 5, 6, 3, 7, 5 ]
  def initialize(number)
    @number = number.to_i
  end

  def total_leds
    SevenSegment::LED_LIGHTS[@number]
  end
end

# Automatic test
class ModulinoTest < Test::Unit::TestCase
  def test_clock
    seconds = 0
    assert_equal( 36 , Clock.new(seconds).sum_leds_on)

    seconds = 4
    assert_equal( 172 , Clock.new(seconds).sum_leds_on)
  end
end

