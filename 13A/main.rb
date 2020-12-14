arrive = values = $stdin.readline.strip.to_i
values = $stdin.readline.strip.split(',').select{|v| v != 'x'}.map(&:to_i)
min_dif = arrive
bus_min_dif = -1

values.each do |bus_id|
  loops = (arrive / bus_id) + 1

  next_loop = bus_id * loops
  dif = next_loop - arrive
  if dif < min_dif
    min_dif = dif
    bus_min_dif = bus_id
  end
end

p bus_min_dif * min_dif