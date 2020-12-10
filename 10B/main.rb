def arrange(value, hash, mem)
  return 0 if value < 0
  return 1 if value == 0

  return mem[value] if mem.key? value

  total = 0
  (1..3).each do |offset|
    total += arrange(value-offset, hash, mem) if hash.key? value - offset
  end

  mem[value] = total
  return total
end

max = 0
hash = {}
mem = {}

$stdin.each_line do |line|
  value = line.to_i
  max = value if value > max
  hash[value] = true
end
hash[0] = true


p arrange(max+3, hash, mem)




