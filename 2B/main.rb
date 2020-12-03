valid_count = 0

def valid_password?(password, pos1, pos2, letter)
  return (password[pos1] == letter) ^ (password[pos2] == letter)
end

$stdin.each_line do |line|
  interval, letter, password = line.chomp.split(' ')
  pos1, pos2 = interval.chomp.split('-').map(&:to_i)
  letter = letter.chomp[0..-2]

  valid_count+= 1 if valid_password?(password, pos1-1, pos2-1, letter)
end

p valid_count




