hash = {}
GOAL = 2020

def multiply_if_sum(hash, sum_goal, quantity)
  hash.each do |k, v|
    dif = sum_goal - k
    if quantity == 2
      return dif * k if hash.key? dif
    else
      result = multiply_if_sum(hash, dif, quantity-1)
      return k * result unless result.nil?
    end
  end
  return nil
end

$stdin.each_line do |line|
  value = line.chomp.to_i
  hash[value] = true
end

p multiply_if_sum(hash, GOAL, 3)



