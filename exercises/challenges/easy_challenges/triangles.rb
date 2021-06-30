=begin
Write a program to determine whether a triangle is equilateral, isosceles, or
scalene.

An equilateral triangle has all three sides the same length.

An isosceles triangle has exactly two sides of the same length.

A scalene triangle has all sides of different lengths.

Note: For a shape to be a triangle at all, all sides must be of length > 0, and
the sum of the lengths of any two sides must be greater than the length of the
third side.

=end

class Triangle
  attr_reader :sides

  def initialize(side_1, side_2, side_3)
    @sides = [side_1, side_2, side_3].sort
    raise ArgumentError if invalid?
  end

  def invalid?
    sides[0] <= 0 || sides[2] >= (sides[0] + sides[1])
  end

  def kind
    if sides.all? { |side| side == sides[0]}
      'equilateral'
    elsif sides[0] == sides[1] || sides[1] == sides[2]
      'isosceles'
    else
      'scalene'
    end
  end
end
