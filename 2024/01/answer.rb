require '../../helpers'

def insert_entry(new_value, hash)
  if hash.has_key?(new_value)
    hash[new_value] += 1
  else
    hash[new_value] = 1
  end

  hash
end

def diff(a, b)
  (a - b).abs
end

def score_collection_difference(arr_1, arr_2)
  diff_score = 0

  arr_1.size.times do |i|
    diff_score += diff(arr_1[i], arr_2[i])
  end

  diff_score
end

def execute(file_path = "./input.txt")
  array_a = []
  array_b = []
  
  Helpers.process_input(file_path) do |line|
    info = line.scan(/(\S+) *(\S+)/)[0]
  
    array_a << info[0].to_i
    array_b << info[1].to_i
  end
  
  array_a.sort!
  array_b.sort!
  
  score_collection_difference(array_a, array_b)
end

Helpers.print_pretty_answers([
  execute("./example.txt"), # => 11
  execute # => 2430334
])

