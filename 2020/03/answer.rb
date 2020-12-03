require '../helpers'

MAP = []

Helpers.process_input("./map.txt") { |line| MAP << line }

def collision?(coordinate)
  coordinate == "#"
end

def count_collisions(x_movement, y_movement = 1)
  x = 0
  y = 0
  collisions = 0

  x_bound = MAP[y].size

  while MAP.size > y
    collisions += 1 if collision?(MAP[y][x])
    x += x_movement
    x %= x_bound
    y += y_movement
  end

  collisions
end

# Part 1
collisions_one = count_collisions(3)

# Part 2
collisions_two = [
  count_collisions(1),
  count_collisions(3),
  count_collisions(5),
  count_collisions(7),
  count_collisions(1, 2)
].reduce(:*)

Helpers.print_pretty_answers([
  collisions_one, # => Part 1 Answer: 198
  collisions_two # => Part 2 Answer: 5140884672
])
