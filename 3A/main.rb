matrix = []

$stdin.each_line do |line|
  line = line.chomp.split('')
  matrix.append(line)
end

def count_trees(matrix, i, j)
  return 0 if i >= matrix.length

  tree = 0
  tree = 1 if matrix[i][j%matrix[i].length] == '#'

  return tree + count_trees(matrix, i+1, j+3)
end

p count_trees(matrix, 0, 0)

