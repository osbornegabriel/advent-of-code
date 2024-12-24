require '../../helpers'

def find_foo(code, max, match)
  rows = Array(0..max)

  code.length.times do |i|
    back_rows = rows.slice!((rows.size/2)..rows.size)
    rows = code[i] == match ? rows : back_rows
  end

  rows[0]
end

def find_row(row_code)
  find_foo(row_code, 127, "F")
end

def find_column(column_code)
  find_foo(column_code, 7, "L")
end

highest = 0
seats = {}

Helpers.process_input do |line|
  info = line.scan(/(.{7})(.{3})/)[0]
  row_code = info[0]
  column_code = info[1]

  row = find_row(row_code)
  column = find_column(column_code)

  seat_id = (row * 8) + column
  highest = seat_id if seat_id > highest
  seats[seat_id] = seat_id + 1
end

seat = nil
seats.keys.each do |k|
  seat = seats[k]
  break if !seats[k+1] && seats[k+2]
end

Helpers.print_pretty_answers([
  highest,
  seat
])