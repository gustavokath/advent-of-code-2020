numbers = arrive = values = $stdin.readline.strip.split(',').map(&:to_i)

map = {}
spoken = 0

numbers.each_with_index do |n, i|
  map[n] = i+1
end

(numbers.length+2..2020).each do |round|

  unless map.key? spoken
    map[spoken] = round-1
    spoken = 0
    next
  end
  last_spoken = spoken


  spoken = (round-1) - map[spoken]

  map[last_spoken] = round-1
end

p spoken