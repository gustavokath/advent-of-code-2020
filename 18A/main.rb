sum = 0
$stdin.each_line do |line|
  expression = line.strip.split('').filter{ |v| v != ' ' }

  queue = []
  prev_value = nil
  prev_op = nil
  expression.each do |cur|
    if cur == '('
      queue.push(prev_value)
      queue.push(prev_op)
      prev_op = nil
      prev_value = nil
      next
    end

    if cur == ')'
      next if queue.empty?

      op = queue.pop
      enqeued_value = queue.pop
      if enqeued_value != nil
        if op == '*'
          prev_value *= enqeued_value.to_i
        elsif op == '+'
          prev_value += enqeued_value.to_i
        end
      end
      next
    end

    if cur == '*' || cur == '+'
      prev_op = cur
      next
    end

    if prev_value == nil
      prev_value = cur.to_i
    elsif prev_op == '*'
      prev_value *= cur.to_i
    elsif prev_op == '+'
      prev_value += cur.to_i
    end
  end

  sum += prev_value
end

p sum

