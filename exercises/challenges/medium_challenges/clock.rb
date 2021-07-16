=begin
Create a clock that is independent of date.

You should be able to add minutes to and subtract minutes from the time
represented by a given clock object. Two clock objects that represent the same
time should be equal to each other.

You may not use any built-in date or time functionality; just use arithmetic
operations.

PROBLEM
- create class that takes input integers for hours and optionally minutes and
  converts it into 24 hour clock string format
- class must also be able to add and subtract minutes
  - when adding minutes, if original number hits 60, convert minutes to 00 and
    add 1 to hours; if hours hit 24, convert hours to 00.
- seems ok to assume valid input?

EXAMPLES

DATA
- input is integer, output is string, not sure how to handle conversions.
  Integers?

ALGORITHM
- Create Clock class
- Create constant MAX_MINUTES, set to 60
- Create constant MAX_HOURS, set to 24
- create class method, at, that t

=end

class Clock
  attr_accessor :hours, :minutes

  MAX_HOURS = 24
  MAX_MINUTES = 60

  def initialize(hours, minutes=0)
    @hours = hours
    @minutes = minutes
  end

  def self.at(hours, minutes=0)
    new(hours, minutes)
  end

  def +(more_minutes)
    if minutes + more_minutes < MAX_MINUTES
      self.minutes += more_minutes
    else
      self.minutes = ((minutes + more_minutes) % MAX_MINUTES)
      self.hours += (minutes + more_minutes) / MAX_MINUTES
      self.hours = (hours % MAX_HOURS) if hours >= MAX_HOURS
    end

    self
  end

  def -(less_minutes)
    if minutes - less_minutes >= 0
      self.minutes -= less_minutes
    else
      self.minutes = ((minutes - less_minutes) % MAX_MINUTES)
      self.hours += ((minutes - less_minutes) / MAX_MINUTES)
      self.hours -= 1 if less_minutes > MAX_MINUTES
      until hours >= 0
        self.hours = MAX_HOURS + hours
      end
    end

    self
  end

  def ==(other)
    to_s.eql?(other.to_s)
  end

  def to_s
    hrs = single_digit_formatter(hours)
    mins = single_digit_formatter(minutes)
    "#{hrs}:#{mins}"
  end

  private

  def single_digit_formatter(num)
    (0..9).include?(num) ? "0#{num}" : num.to_s
  end
end
