=begin
Exploring Procs, Lambdas, and Blocks: Definition and Arity
***This exercise covers material that you do not have to master. We provide the
exercise as a way to explore the differences between procs, lambdas, and blocks.

For this exercise, we'll be learning and practicing our knowledge of the arity
of lambdas, procs, and implicit blocks. Two groups of code also deal with the
definition of a Proc and a Lambda, and the differences between the two. Run each
group of code below:
- For your answer to this exercise, write down your observations for each group
  of code.
- After writing out those observations, write one final analysis that explains
  the differences between procs, blocks, and lambdas.
=end

# Group 1
# my_proc = proc { |thing| puts "This is a #{thing}." }
# puts my_proc
# puts my_proc.class
# my_proc.call
# my_proc.call('cat')

# - Line 18 outputs the Object ID for the proc object stored in my_proc.
# - Line 19 outputs "Proc", the class of the object assigned to my_proc.
# - Line 20 excutes the block stored in the proc, however since no argument is
#   supplied (and the block takes one argument), the argument is assigned to
#   nil, which outputs as an empty string, so the string outpts, without the
#   interpollation.
# - Line 12 does supply an argument, so the string outputs with the argument
#   interpolated into the string output from the block.

# Group 2
# my_lambda = lambda { |thing| puts "This is a #{thing}." }
# my_second_lambda = -> (thing) { puts "This is a #{thing}." }
# puts my_lambda
# puts my_second_lambda
# puts my_lambda.class
# my_lambda.call('dog')
# my_lambda.call
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }

# - Line 33 creates a proc object woth lambda semantics using the Kernel#lambda
#   method, and assigns it to my_lambda
# - Line 34 creates a proc object with lambda semantics, using the lambda
#   literal syntax
# - Line s 35 and 36 output the object ID's for the lambda objects assigned to
#   my_lambda and my_second_lambda, respectively
# - Line 37 outputs proc because a lambda is a type of proc object that has
#   strict arity--meaning it must pass the correct number of arguments to the
#   block in order for the block to execute
# - Line 38 executes the block with the provided argument, as required by the
#   lambda's strict arity rules
# - Line 39 raises an argument error, because the block requires one argument
#   and no argument is provided, and according to lambda's strict arity rules,
#   the correct number of arguments must be provided in order for the block to
#   execute
# - Lambda is not a class so you cannot create a new lambda by calling
#   Lambda.new, so line 40 does will think the Lambda is a constant

# # Group 3
# def block_method_1(animal)
#   yield
# end

# block_method_1('seal') { |seal| puts "This is a #{seal}."}
# block_method_1('seal')

# - In lines 61-63 a method is created that takes an argument, and yields to a
#   block (and does not supply a block_given? conditional)
# - In line 65, the block_method_1 method is called and an argument is supplied
#   and a block is passed.  The block takes an argument, however no block is
#   argument is passed to the block at the yield call on line 62, so the block
#   executes without an argment, using nil as the argument.  When nil is
#   converted to a string, it produces an empty string, so the interpolated
#   argument does not add any characters to the string output.
# - In line 66, the block_method_1 method is passed with an argument but without
#   a block.  Since no block_given? conditional was supplied when yield was
#   called, the yield is unable to invoke a block, and a local jump error is
#   raised.

# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
block_method_2('turtle') { puts "This is a #{animal}."}

# - In lines 82-84, a method is created that takes one argument, then yields to
#   a block (without a block_given? conditional), and passes the argument to the
#   block.
# - In lines 86, the method is called with an argument, and a block that takes
#   one argument.  Per the yield on line 83, the method's argument, turtle, is
#   passed to the block, and the resulting output includes the interpolated
#   'turtle'
# - In the method call from lines 87-89, "turtle" is passed as an argument to
#   the method, and the block takes two arguments. Blocks have leniant arity so
#   the block is still able to execute, but will pass nil as the second argument
#   since no second argument is provided.
# - In line 90, the block passed does not accept an argument, so the
#   interpolated 'animal' does not reference the method argument or any other
#   existing variable or method, thus an undefined local variable or method
#   error is raised.  Because of lenient arity for blocks, an extra argument
#   is not a problem and that alone would not raise an error; the block would
#   execute successfully without an argument; the issue is that "animal" does
#   not point to any existing methods or local variables.
