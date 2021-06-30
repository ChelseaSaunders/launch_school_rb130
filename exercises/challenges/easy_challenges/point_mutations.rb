=begin
Write a program that can calculate the Hamming distance between two DNA strands.

A mutation is simply a mistake that occurs during the creation or copying of a
nucleic acid, in particular DNA. Because nucleic acids are vital to cellular
functions, mutations tend to cause a ripple effect throughout the cell. Although
mutations are technically mistakes, a very rare mutation may equip the cell with
a beneficial attribute. In fact, the macro effects of evolution are attributable
by the accumulated result of beneficial microscopic mutations over many
generations.

The simplest and most common type of nucleic acid mutation is a point mutation,
which replaces one base with another at a single nucleotide.

By counting the number of differences between two homologous DNA strands taken
from different genomes with a common ancestor, we get a measure of the minimum
number of point mutations that could have occurred on the evolutionary path
between the two strands.

This is called the Hamming distance.

The Hamming distance is only defined for sequences of equal length. If you have
two sequences of unequal length, you should compute the Hamming distance over
the shorter length.

PROBLEM
Take two strings.
- if strings are different length, ONLY take into account the first set of
  characters equal to the length of the shorter sring e.g.
  "short"
  "loooooooong"
  would compare "short" and "loooo"
- for the same-length strings, determine the number of characters that differ
  between the two strings

EXAMPLES

GAGCCTACTAACGGGAT
CATCGTAATGACGGCCT
^ ^ ^  ^ ^    ^^
The Hamming distance between these two DNA strands is 7.

- case sensitive?

DATA
input will be strings
output will be integer (0 or greater but less than or equal to the length of the
  shortest string)

ALGORITHM

create class DNA
  -upon initialization, take one string and assign it to instance variable
    strand

  -create instance method, hamming_distance that takes one string as an
    argument, new_strand
    if strand length is less than or equal to new_strand length, assign method
      variable short to strand otherwise assign it to strand
  # this will ensure two strands are of equal length

  - initialize local variable hamming_distance to 0
  - create loop that executes strand length times, with parameter idx
    - if strand[idx] != new_strand[idx], add 1 to hamming_distance

  - return haming_distance
=end

class DNA
  attr_reader :strand

  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(new_strand)
    @strand.length <= new_strand.length ? short = @strand : short = new_strand
    distance = 0
    short.length.times { |i| distance += 1 if @strand[i] != new_strand[i] }
    distance
  end
end
