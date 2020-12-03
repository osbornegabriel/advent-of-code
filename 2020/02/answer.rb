require '../helpers'

def part_one_valid?(min:, max:, char:, password:)
  count = password.count(char)
  (min..max).include?(count)
end

# NOTE: reusing arg names, as the required inputs
# are the same as those used for part one password
# validation.
def part_two_valid?(min:, max:, char:, password:)
  (password[min - 1] == char) ^
    (password[max - 1] == char)
end

def scan_line(line)
  pw_group = line.scan(/^(\d+)-(\d+) (\w): (\w+)$/)[0]

  {
    min: pw_group[0].to_i,
    max: pw_group[1].to_i,
    char: pw_group[2],
    password: pw_group[3]
  }
end

part_one_answer = 0
part_two_answer = 0

Helpers.process_input("./passwords.txt") do |line|
  args = scan_line(line)

  part_one_answer += 1 if part_one_valid?(args)
  part_two_answer += 1 if part_two_valid?(args)
end

Helpers.print_pretty_answers([
  part_one_answer, # => Part 1 Answer: 447
  part_two_answer # => Part 2 Answer: 249
])
