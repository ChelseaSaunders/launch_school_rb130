=begin
Diamond
The diamond exercise takes as its input a letter, and outputs it in a diamond
shape. Given a letter, it prints a diamond starting with 'A', with the supplied
letter at the widest point.

The first row contains one 'A'.
The last row contains one 'A'.
All rows, except the first and last, have exactly two identical letters.
The diamond is horizontally symmetric.
The diamond is vertically symmetric.
The diamond has a square shape (width equals height).
The letters form a diamond shape.
The top half has the letters in ascending order.
The bottom half has the letters in descending order.
The four corners (containing the spaces) are triangles.

PROBLEM:
Rules: take single uppercase string letter
- return string "diamond" that has one row for each letter starting at A and
  ending at input letter, then going from input letter back down to A--one row
  each
  - each row must have the same number of characters; totaling the number of
    letters from A - input area, plus 2
  - First and last row will all be whitespace except the letter A, centered
  - center row will start and end with input letter, and be separated by
    whitespace
  - c

EXAMPLES:
Diamond for letter 'A':

A
Diamond for letter 'C':

  A
 B B
C   C
 B B
  A
Diamond for letter 'E':

    A
   B B
  C   C
 D     D
E       E
 D     D
  C   C
   B B
    A

DATA:
Input: string, uppercase single alphabetic letter
Output: String

ALGORITHM:
Create class Diamond
- Create class method, make_diamond that takes one capital string letter as
  an argument
- create a range from A to input letter, convert to array, and assign to
  ascending
- assign space_total to length of ascending
- assign descending to reversed ascending, with first element removed (since
  the longest row from input letter should not be duplicated
- create empty string, assign to diamond
- iterate through ascending, using char as parameter, and middle_spaces as index
  - if char is "A", add strin of space_total / 2, 'A', space_total/2 and newline
    to diamond
    assign edge_spaces to  space_total - middle_spaces / 2
  - if not, add edge_spaces + char + middle_spaces + char + edge_spaces to
    diamond

=end

class Diamond
  def self.make_diamond(letter)
    return "A\n" if letter == "A"

    @letters = ('A'..letter).to_a
    @edge = @letters.length - 1
    @middle = 1

    generate_diamond_top_and_bottom + generate_diamond_upper +
      generate_diamond_lower + generate_diamond_top_and_bottom
  end

  def self.generate_diamond_top_and_bottom
    "#{' ' * @edge}A#{' ' * @edge}\n"
  end

  def self.generate_diamond_upper
    upper = ''
    @letters[1..-1].each do |char|
      @edge -= 1
      upper << "#{' ' * @edge}#{char}#{' ' * @middle}#{char}#{' ' * @edge}\n"
      @middle += 2
    end
    upper
  end

  def self.generate_diamond_lower
    @middle -= 2
    @edge += 1
    lower = ''

    @letters.reverse[1..-2].each do |char|
      @middle -= 2
      lower << "#{' ' * @edge}#{char}#{' ' * @middle}#{char}#{' ' * @edge}\n"
      @edge += 1
    end

    lower
  end
end
