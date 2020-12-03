valid_count = 0

def valid_password?(password, min, max, letter)
  count = 0
  password.each_char do |curr|
    count+=1 if curr == letter
  end

  return count >= min && count <= max
end

$stdin.each_line do |line|
  interval, letter, password = line.chomp.split(' ')
  min, max = interval.chomp.split('-').map(&:to_i)
  letter = letter.chomp[0..-2]

  valid_count+= 1 if valid_password?(password, min, max, letter)
end

p valid_count




