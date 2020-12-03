module Helpers
  def self.process_input(file_path = "./input.txt")
    f = File.readlines(file_path)
    f.each { |line| yield(line.strip) }
  end

  def self.print_pretty_answers(answers)
    answers.each_with_index { |answer, i| print_pretty_answer(answer, i+1) }
  end

  private

  def self.print_pretty_answer(answer, part)
    puts "Part #{part} Answer: #{answer}"
  end
end