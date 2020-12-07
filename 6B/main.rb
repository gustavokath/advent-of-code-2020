

count = 0
answer_set = {}
group_size = 0

$stdin.each_line do |line|
  line = line.chomp
  if line == ''
    count += answer_set.select { |k, v| v == group_size }.size
    answer_set = {}
    group_size = 0
  else
    group_size += 1
    line.each_char do|letter|
      answer_set[letter] ||= 0
      answer_set[letter] += 1
    end
  end
end

count +=  answer_set.select { |k, v| v == group_size }.size

p count