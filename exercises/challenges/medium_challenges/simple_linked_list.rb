=begin
Write a simple linked list implementation. The linked list is a fundamental data
structure in computer science, often used in the implementation of other data
structures.

The simplest kind of linked list is a singly linked list. Each element in the
list contains data and a "next" field pointing to the next element in the list
of elements. This variant of linked lists is often used to represent sequences
or push-down stacks (also called a LIFO stack; Last In, First Out).

Let's create a singly linked list whose elements may contain a range of data
such as the numbers 1-10. Provide functions to reverse the linked list and
convert a linked list to and from an array.

PROBLEM

EXAMPLES

DATA
- input:
- output:
- tools:

ALGORITHM

=end

class SimpleLinkedList
  attr_accessor @list

  def initialize
    @list = []
  end

  def size

  end

  def empty?

  end

  def push(num)
  #instance of element

  end

  def peek
    list[0]
  end

  def head
    #first item in list?
  end

  def pop
    list.pop
  end

  def from_a(new_list)
    new_list.nil? ? self.list = [nil] : self.list = new_list
  end

  def to_a
    list
  end

  def reverse
    list.reverse
  end
end

class Element
  def initialize(num)
    @num = num
  end

  def datum

  end

  def tail?

  end

  def next

  end
end
