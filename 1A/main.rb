hash = {}
SUM = 2020

$stdin.each_line do |line|
  value = line.chomp.to_i
  dif = SUM - value
  if hash.key? dif
    p dif * value
    break
  end

  hash[value] = true
end