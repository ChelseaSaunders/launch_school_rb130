# We can use the splat operator(*) to do something like this:

#   raven, finch, *raptors = %w(raven finch hawk eagle)
#   p raven # => 'raven'
#   p finch # => 'finch'
#   p raptors  # => ['hawk','eagle']

# Based on the examples shown above, write a method that takes an array as an
# argument. The method should yield the contents of the array to a block, which
# should assign your block variables in such a way that it ignores the first two
# elements, and groups all remaining elements as a raptors array.

def generate_raptor_array(array)
  yield(array)
end

birds = %w(towhee, junco, eagle, hawk, osprey)

generate_raptor_array(birds) { |_, _, *raptors| puts raptors}
