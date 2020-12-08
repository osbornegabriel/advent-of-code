require '../helpers'

class Tallyer
  ALPHABET = Array("a".."z")

  def self.answered_questions(card)
    score = 26 - (ALPHABET - card.keys).size
  end

  def self.all_yes(card, group_size)
    card.values.count(group_size)
  end
end

individual_total = 0
group_total = 0

Helpers.process_chunk_input do |chunk|
  cards = chunk.split("\n")
  answers = Hash.new(0)

  cards.each do |card|
    card.chars.each { |c| answers[c] += 1 }
  end

  individual_total += Tallyer.answered_questions(answers)
  group_total += Tallyer.all_yes(answers, cards.size)
end

Helpers.print_pretty_answers([
  individual_total, # => 6878
  group_total # => 3464
])