=begin

Meetups are a great way to meet people who share a common interest. Typically,
meetups happen monthly on the same day of the week. For example, a meetup's
meeting may be set as:

The first Monday of January 2021
The third Tuesday of December 2020
The teenth wednesday of December 2020
The last Thursday of January 2021
In this program, we'll construct objects that represent a meetup date. Each
object takes a month number (1-12) and a year (e.g., 2021). Your object should
be able to determine the exact date of the meeting in the specified month and
year. For instance, if you ask for the 2nd Wednesday of May 2021, the object
should be able to determine that the meetup for that month will occur on the
12th of May, 2021.

The descriptors that may be given are strings: 'first', 'second', 'third',
'fourth', 'fifth', 'last', and 'teenth'. The case of the strings is not
important; that is, 'first' and 'fIrSt' are equivalent. Note that "teenth" is a
made up word. There was a meetup whose members realised that there are exactly 7
days that end in '-teenth'. Therefore, it's guaranteed that each day of the week
(Monday, Tuesday, ...) will have exactly one date that is the "teenth" of that
day in every month. That is, every month has exactly one "teenth" Monday, one
"teenth" Tuesday, etc. The fifth day of the month may not happen every month,
but some meetup groups like that irregularity.

The days of the week are given by the strings 'Monday', 'Tuesday', 'Wednesday',
'Thursday', 'Friday', 'Saturday', and 'Sunday'. Again, the case of the strings
is not important.

PROBLEM

Initiaize a meetup object with a year and at least one month

EXAMPLES

DATA

ALGORITHM
create helper method, find_weekdays
create empty array
assign day to 1
create loop
assign current_day to date.new with day
break if current day
 is not the same month
if current day = date.new (use 1 for day) is _wednesday(whatever) AND still
  right monthadd to arr
  current day + 7
else day + 1

case statement for weekday, when to add to
=end

require 'date'

class Meetup
  attr_reader :year, :month

  NUMBERED_WEEKDAYS = { 'sunday' => 0, 'monday' => 1, 'tuesday' => 2,
                        'wednesday' => 3, 'thursday' => 4, 'friday' => 5,
                        'saturday' => 6 }

  NUMBERED_SCHEDULE = { 'first' => 0, 'second' => 1, 'third' => 2,
                        'fourth' => 3, 'fifth' => 4 }

  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(weekday, schedule)
    weekdays = find_weekdays(weekday.downcase)

    if NUMBERED_SCHEDULE.key?(schedule.downcase)
      weekdays[NUMBERED_SCHEDULE[schedule.downcase]]
    elsif schedule.downcase == 'last'
      weekdays[-1]
    else
      find_teenth(weekdays)
    end
  end

  private

  def find_weekdays(weekday)
    numbered_weekday = NUMBERED_WEEKDAYS[weekday]
    weekdays = []
    day = 1

    loop do
      break if !Date.valid_civil?(year, month, day)
      current_date = Date.civil(year, month, day)

      if current_date.wday == numbered_weekday
        weekdays << current_date
        day += 7
      else
        day += 1
      end
    end

    weekdays
  end

  def find_teenth(array)
    array.select { |date| (13..19).include?(date.mday) }.pop
  end
end
