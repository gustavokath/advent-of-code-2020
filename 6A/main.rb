

count = 0
answer_set = {}

$stdin.each_line do |line|
  line = line.chomp
  if line == ''
    count += answer_set.size
    answer_set = {}
  else
    line.each_char { |letter| answer_set[letter] = true }
  end
end

count += answer_set.size

p count