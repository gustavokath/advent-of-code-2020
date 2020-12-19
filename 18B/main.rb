sum = 0
$stdin.each_line do |line|
  expression = line.strip.split(' ')

  sum_idx = []
  expression.each_with_index do |v, idx|
    sum_idx.push idx if v == '+'
  end

  sum_idx.each do |idx|
    expression[idx-1] = "(#{expression[idx-1]}"
    expression[idx+1] = "#{expression[idx+1]})"
  end
  value = eval(expression.join(' '))

  sum += value
end


p sum

