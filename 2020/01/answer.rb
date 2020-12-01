# Part 1
num_pairs = {}
File.open("./input.txt").each do |line|
  i = line.to_i
  inverse_value = 2020 - i
  num_pairs[i] = inverse_value
end

answer = nil

num_pairs.each do |num, inverse_value|
  if num_pairs[inverse_value]
    answer = num_pairs[inverse_value] * inverse_value
    break
  end
end

p answer

# Part 2
nums = []
File.open("./input.txt").each { |line| nums << line.to_i }

combos = nums.combination(3).to_a
answer_2 = combos.find { |c| c.reduce(:+) == 2020 }
p answer_2.reduce(:*)