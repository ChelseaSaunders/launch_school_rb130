=begin
Create a custom set type.

Sometimes it is necessary to define a custom data structure of some type, like a
set. In this exercise you will define your own set type. How it works internally
doesn't matter, as long as it behaves like a set of unique elements that can be
manipulated in several well defined ways.

In some languages, including Ruby and JavaScript, there is a built-in Set type.
For this problem, you're expected to implement your own custom set type. Once
you've reached a solution, feel free to play around with using the built-in
implementation of Set.

For simplicity, you may assume that all elements of a set must be numbers.

PROBLEM
Take a set of numbers (array?)
Create methods that manipulate the set as required by the test problems
- create empty? method that determines whether array has any elements and
  returns a boolean
- create contains? set that determines whether a specific element is included
  in the set and returns a boolean
- create method subset? that determines whether the calling set is contained
  within the argument subset
    - if calling subset is empty, return true
    - if calling subset is not empty and argument subset is, return fals
    - if all elements in calling subset are in argument subset, and argument
      subset is larger, return true
- create method disjoint?
  - if both sets are NOT empty and have any shared elements, return false,
    otherwise, return true
- create eql? method
  - only return true if the unique values in the sets are the same.
  - return false if either set is empty
- create method add that takes an argument
  - appends argument to end of set unless argument is already in set, then does
    nothing
- create method intersecton that returns a custom set object with shared
  elements between the calling object and argument object
  - if either set is empty or there are no shared elements, return empty custom
    set argument
- create method difference that returns a new custom set object that contains
  any elements in calling object that are NOT in argument object
- create union method that appends any unique elements from argument set to
  calling set
EXAMPLES

DATA

ALGORITHM

=end

class CustomSet
  attr_accessor :set

  def initialize(set=[])
    @set = set
  end

  def empty?
    set.empty?
  end

  def contains?(num)
    set.include?(num)
  end

  def subset?(other)
    set.each { |num| return false unless other.set.include?(num) }
    true
  end

  def disjoint?(other)
    set.each { |num| return false if other.set.include?(num) }
    true
  end

  def eql?(other)
    set.uniq.sort == other.set.uniq.sort
  end

  def add(num)
    set << num unless contains?(num)
    self
  end

  def intersection(other)
    CustomSet.new(set.select { |num| other.contains?(num) })
  end

  def difference(other)
    CustomSet.new(set.difference(other.set))
  end

  def union(other)
    CustomSet.new(set.union(other.set).sort)
  end

  def ==(other)
    eql?(other)
  end
end
