

def to(number)
  multiples = []

  array_of_steps = [3, 5]

  array_of_steps.each do |num|
    num.step(by: num,to: number - 1) { |n| multiples << n }
  end

  p multiples.uniq.sum
end

to(10)
