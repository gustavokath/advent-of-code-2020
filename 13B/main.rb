arrive = values = $stdin.readline.strip.to_i
values = $stdin.readline.strip.split(',').map(&:to_i)
bus = []
values.each_with_index do |value, idx|
  bus.append([value, idx]) if value != 0
end

lcm = 1
timestamp = 0
(0..bus.length-2).each do |i|
  bus_id = bus[i+1][0]
  idx = bus[i+1][1]
  lcm *= bus[i][0]
  while (timestamp + idx) % bus_id != 0 do
    timestamp += lcm
  end
end

p timestamp