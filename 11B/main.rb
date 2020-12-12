def can_be_seated?(matrix, i, j)
  can_seat = true
  offsets = {}
  (-1..1).each {|i| (-1..1).each { |j| offsets[[i,j]] = true if i != 0 || j != 0 }}

  multiplier = 1
  prev_offsets = offsets.map(&:clone)
  until offsets.empty?
    offsets.keys.each_with_index do |offset, idx|
      offset_i = offset[0] * multiplier
      offset_j = offset[1] * multiplier
      if offset_i == 0 && offset_j == 0
        offsets.delete_at(idx)
        next
      end
      if i + offset_i < 0 || j + offset_j < 0 || i + offset_i >= matrix.length || j + offset_j >= matrix[i+offset_i].length
        offsets[offset] = false
        next
      end

      can_seat = false if matrix[i+offset_i][j+offset_j] == '#'
      offsets[offset] = false if ['#', 'L'].include?(matrix[i+offset_i][j+offset_j])
    end
    offsets = offsets.select { |k, v| v == true }
    multiplier += 1
  end
  return can_seat
end

def need_to_left?(matrix, i, j)
  offsets = {}
  (-1..1).each {|i| (-1..1).each { |j| offsets[[i,j]] = true if i != 0 || j != 0 }}
  count = 0

  multiplier = 1
  until offsets.empty?
    offsets.keys.each_with_index do |offset, idx|
      offset_i = offset[0] * multiplier
      offset_j = offset[1] * multiplier
      if i + offset_i < 0 || j + offset_j < 0 || i + offset_i >= matrix.length || j + offset_j >= matrix[i+offset_i].length
        offsets[offset] = false
        next
      end

      count += 1 if matrix[i+offset_i][j+offset_j] == '#'
      offsets[offset] = false if ['#', 'L'].include? matrix[i+offset_i][j+offset_j]
    end
    offsets = offsets.select { |k, v| v == true }
    multiplier += 1
  end
  return count
end

input = []

$stdin.each_line do |line|
  input.append(line.strip.split(''))
end

current = input
prev = []

while current != prev
  prev = current.map(&:clone)

  prev.each_with_index do |line, i|
    prev[i].each_with_index do |value, j|
      if value == 'L' && can_be_seated?(prev, i, j)
        current[i][j] = '#'
      end

      if value == '#' && need_to_left?(prev, i, j) >= 5
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

