MAP = []

File.readlines("./map.txt").each do |line|
  MAP << line.strip
end

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
p collisions_one

# Part 2
collisions_two_total = count_collisions(1)
collisions_two_total *= count_collisions(3)
collisions_two_total *= count_collisions(5)
collisions_two_total *= count_collisions(7)
collisions_two_total *= count_collisions(1, 2)

p collisions_two_total
