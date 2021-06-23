# Write a method that takes an optional block. If the block is specified, the
# method should execute it, and return the value returned by the block. If no
# block is specified, the method should simply return the String 'Does not
# compute.'.

def compute
  block_given? ? yield : 'Does not compute.'
end

p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'

# Further Exploration
# Modify the compute method so it takes a single argument and yields that
# argument to the block. Provide at least 3 examples of calling this new version
# of compute, including a no-block call.

def compute(num)
  block_given? ? yield(num) : 'Does not compute.'
end

p compute(4) { |num| num + 4 } == 8
p compute(4) { |num| num * 2 } == 8
p compute(4) == 'Does not compute.'
