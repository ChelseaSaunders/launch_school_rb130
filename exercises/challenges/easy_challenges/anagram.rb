=begin
Write a program that takes a word and a list of possible anagrams and selects
the correct sublist that contains the anagrams of the word.

For example, given the word "listen" and a list of candidates like "enlists",
"google", "inlets", and "banana", the program should return a list containing
"inlets". Please read the test suite for the exact rules of anagrams.

PROBLEM

Starting with an inial string, take an array of strings and return an array of
  only the strings that can be made up from letters from the original string.
  - matching strings must be the same length as original string
  - this is NOT case sensitive
  - identical words are not annagrams

EXAMPLES
See test suite.

DATA
Input for new class: string
Input for class method: array of strings
Output for method: array of strings (subset of method input array)

ALGORITHM
- Create class Anagram that takes one string as an argument upon initialization,
  and assign to @string
- create class method, match that takes an array of sunstrings as an argument
  - select from that array only substrings that, when sorted and lowercase,
    match the @string, when sorted and lowercase, AND, when lowercase do not
    match @string lowercase.
  - Return these selections
=end

class Anagram
  attr_reader :string

  def initialize(string)
    @string = string
  end

  def match(array)
    new_str = @string.downcase.split('').sort
    array.select do |str|
      str.downcase != @string.downcase && new_str == str.downcase.split('').sort
    end
  end
end
