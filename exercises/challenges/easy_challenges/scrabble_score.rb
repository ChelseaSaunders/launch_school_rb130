=begin
Write a program that, given a word, computes the Scrabble score for that word.

Letter Values

You'll need the following tile scores:

Letter	Value
A, E, I, O, U, L, N, R, S, T =>	1
D, G	=> 2
B, C, M, P => 3
F, H, V, W, Y => 	4
K	=> 5
J, X	=> 8
Q, Z => 10
How to Score

Sum the values of all the tiles used in each word. For instance, lets consider
the word CABBAGE which has the following letters and point values:

3 points for C
1 point for each A (there are two)
3 points for B (there are two)
2 points for G
1 point for E
Thus, to compute the final total (14 points), we count:

3 + 2*1 + 2*3 + 2 + 1
=> 3 + 2 + 6 + 3
=> 5 + 9
=> 14

PROBLEM
- Assign point value to various alphabetical letters; take combinations of
  letters and return the sum of the point value for each letter

- input/letter values are not case sensitive
- letters can occur more than once
- nil/no input/empty string/non-letters should return 0
- must be able to call score on class (not just instance) with string as
  argument

EXAMPLES
see test cases

DATA
input is string or nil
output is integer
hash? to store values?

ALGORITHM
- create class Scrabble that takes one string or nil as input upon
  initialization
- assign that value to @word, and make @word readable
- create constant hash LETTER_SCORES that includes values as scores, and array
  of letters for that score as keys
- create instance method score
  - create variable score and assign to 0
  - return score if @word.nil?
  - uppercase word, split into array of characters, assign to chars_arr
  - iterate through chars_arr using |char| as parameter
      - iterate through hash, using |key, value| as parameter
        - if hash key includes character, add value to score

  - return score

  - create class method score that takes a string argument
      - initialize a new Scrabble object with string as arg, call score on that
        object
=end

class Scrabble
  attr_reader :word

  def initialize(word)
    @word = word
  end

  LETTER_SCORES = { %w(A E I O U L N R S T) =>	1, %w(D G)	=> 2,
                    %w(B C M P) => 3, %w(F H V W Y) =>	4, %w(K) => 5,
                    %w(J X)	=> 8, %w(Q Z) => 10 }

  def score
    total_score = 0
    return total_score if word.nil?

    word.upcase.split('').each do |char|
      LETTER_SCORES.each { |key, val| total_score += val if key.include?(char) }
    end

    total_score
  end

  def self.score(string)
    Scrabble.new(string).score
  end
end
