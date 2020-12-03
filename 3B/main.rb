matrix = []

$stdin.each_line do |line|
  line = line.chomp.split('')
  matrix.append(line)
end

def count_trees(matrix, i, j, delta_i, delta_j)
  return 0 if i >= matrix.length

  tree = 0
  tree = 1 if matrix[i][j%matrix[i].length] == '#'

  return tree + count_trees(matrix, i+delta_i, j+delta_j, delta_i, delta_j)
end

slopes = [[1, 1], [1, 3], [1, 5], [1, 7], [2, 1]]

result = 1
slopes.each do |(delta_i, delta_j)|
  result *= count_trees(matrix, 0, 0, delta_i, delta_j)
end

p result

