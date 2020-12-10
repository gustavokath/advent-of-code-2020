outlets = []
count_dif_1 = 0
count_dif_3 = 0
current = 0
$stdin.each_line do |line|
  outlets.append(line.to_i)
end

outlets.sort!
device_jolts = outlets.last + 3
outlets.append(device_jolts)

outlets.each do |value|
  count_dif_3 += 1 if(value - current == 3)
  count_dif_1 += 1 if(value - current == 1)

  current = value
end

p count_dif_1 * count_dif_3




