require '../helpers'

num_pairs = {}
nums = []

Helpers.process_input do |line|
  i = line.to_i

  # num_pairs used for Part 1
  inverse_value = 2020 - i
  num_pairs[i] = inverse_value

  # nums used for Part 2
  nums << i
end

answer_1 = nil

# Part 1
num_pairs.each do |num, inverse_value|
  if num_pairs[inverse_value]
    answer_1 = num_pairs[inverse_value] * inverse_value
    break
  end
end

# Part 2
combos = nums.combination(3).to_a
answer_2 = combos.find { |c| c.reduce(:+) == 2020 }
answer_2 = answer_2.reduce(:*)

Helpers.print_pretty_answers([
  answer_1, # => Part 1 Answer: 987339
  answer_2 # => Part 2 Answer: 259521570
])