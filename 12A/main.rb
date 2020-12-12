def rotate(value, dir_x, dir_y)
  return dir_x, dir_y if value == 0

  tmp_x = dir_x
  if((value < 0 && dir_y != 0) || (value > 0 && dir_x != 0))
    dir_x = dir_y * -1
    dir_y = tmp_x * -1
  else
    dir_x = dir_y
    dir_y = tmp_x
  end

  dif = value < 0 ? 90 : -90
  return rotate(value + dif, dir_x, dir_y)
end

dir_x = 1
dir_y = 0
x = 0
y = 0

$stdin.each_line do |line|
  op = line[0]
  value = line[1..-1].to_i

  case op
  when 'N'
    y += value
  when 'S'
    y -= value
  when 'E'
    x += value
  when 'W'
    x -= value
  when 'F'
    x += dir_x * value
    y += dir_y * value
  when 'R'
    dir_x, dir_y = rotate(value, dir_x, dir_y)
  when 'L'
    dir_x, dir_y = rotate(-value, dir_x, dir_y)
  end
end

p x.abs + y.abs