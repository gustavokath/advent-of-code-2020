def can_be_seated?(matrix, i, j)
  can_seat = true
  (-1..1).each do |offset_i|
    (-1..1).each do |offset_j|
      next if offset_i == 0 && offset_j == 0
      next if i + offset_i < 0 || j + offset_j < 0 || i + offset_i >= matrix.length || j + offset_j >= matrix[i+offset_i].length

      can_seat = false if matrix[i+offset_i][j+offset_j] == '#'
    end
  end
  return can_seat
end

def need_to_left?(matrix, i, j)
  count = 0
  (-1..1).each do |offset_i|
    (-1..1).each do |offset_j|
      next if offset_i == 0 && offset_j == 0
      next if i + offset_i < 0 || j + offset_j < 0 || i + offset_i >= matrix.length || j + offset_j >= matrix[i+offset_i].length

      count += 1 if matrix[i+offset_i][j+offset_j] == '#'
    end
  end
  return count >= 4
end

input = []

$stdin.each_line do |line|
  input.append(line.strip.split(''))
end


current = input
prev = []
p current

while current != prev
  prev = current.map(&:clone)

  prev.each_with_index do |line, i|
    prev[i].each_with_index do |value, j|
      if value == 'L' && can_be_seated?(prev, i, j)
        current[i][j] = '#'
      end

      if value == '#' && need_to_left?(prev, i, j)
        current[i][j] = 'L'
      end
    end
  end
end

count = 0
prev.each_with_index do |line, i|
  count += line.count('#')
end

p count

