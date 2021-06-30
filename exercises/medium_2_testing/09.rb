# For this exercise you'll be given a sample text file and a starter class. The
# sample text's contents will be saved as a String to an instance variable in
# the starter class.

# The Text class includes a #swap method that can be used to replace all
# occurrences of one letter in the text with another letter. And for this
# exercise we will swap all occurrences of 'a' with 'e'.

# Your task is to write a test suite for class Text. In that test suite write a

# test for the Text method swap. For this exercise, you are required to use the
# minitest methods #setup and #teardown. The #setup method contains code that
# will be executed before each test; #teardown contains code that will be
# executed after each test.

require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use!

require_relative 'text'

class TextTest < Minitest::Test
  def setup
    @text = Text.new('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sed vulputate ipsum.
    Suspendisse commodo sem arcu. Donec a nisi elit. Nullam eget nisi commodo, volutpat
    quam a, viverra mauris. Nunc viverra sed massa a condimentum. Suspendisse ornare justo
    nulla, sit amet mollis eros sollicitudin et. Etiam maximus molestie eros, sit amet dictum
    dolor ornare bibendum. Morbi ut massa nec lorem tincidunt elementum vitae id magna. Cras
    et varius mauris, at pharetra mi.')
  end

  def test_swap
    altered_text_arr = @text.swap('a', 'e').split('')
    original_text_arr = @text.split('')
    original_a_count = original_text_arr.count('a')
    alterted_text_a_count = altered_text_arr.count('a')
    original_e_count = original_text_arr.count('e')
    altered_text_e_count = altered_text_arr.count('e')

    assert_equal original_a_count, altered_text_e_count
    assert_equal original_e_count, altered_text_a_count
  end


  def teardown
  end

end
