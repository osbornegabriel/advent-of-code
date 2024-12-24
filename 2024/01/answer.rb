require '../../helpers'

def diff(a, b)
  (a - b).abs
end

# Part 1
def score_collection_difference(arr_1, arr_2)
  diff_score = 0

  arr_1.size.times do |i|
    diff_score += diff(arr_1[i], arr_2[i])
  end

  diff_score
end

# Part 2
def score_collection_similarity(array, comparison_hash)
  diff_score = 0

  array.each do |c|
    diff_score += c * comparison_hash[c].to_i
  end

  diff_score
end

def execute(file_path = "./input.txt")
  array_a = []
  array_b = []
  
  # For Part 2
  hash_b = {}

  Helpers.process_input(file_path) do |line|
    info = line.scan(/(\S+) *(\S+)/)[0]
    
    item_1 = info[0].to_i
    item_2 = info[1].to_i

    array_a << item_1
    # Part 1 support
    array_b << item_2

    # Part 2 Support
    if hash_b.has_key?(item_2)
      hash_b[item_2] += 1
    else
      hash_b[item_2] = 1
    end
  end
  
  array_a.sort!
  array_b.sort!

  [
    score_collection_difference(array_a, array_b), # part 1
    score_collection_similarity(array_a, hash_b) # part 2
  ]
end

# Part 1
Helpers.print_pretty_answers([
  execute("./example.txt"), # Part 1 => 11, Part 2 => 31
  execute # => Part => 2430334, Part 2 => 28786472
])
