def rotate(value, dir_x, dir_y)
  return dir_x, dir_y if value == 0

  tmp_x = dir_x
  if(value > 0)
    dir_x = dir_y
    dir_y = tmp_x * -1
  else
    dir_x = dir_y * -1
    dir_y = tmp_x
  end

  dif = value < 0 ? 90 : -90
  return rotate(value + dif, dir_x, dir_y)
end

x_ship = 0
y_ship = 0
x_waypoint = 10
y_waypoint = 1

$stdin.each_line do |line|
  op = line[0]
  value = line[1..-1].to_i

  case op
  when 'N'
    y_waypoint += value
  when 'S'
    y_waypoint -= value
  when 'E'
    x_waypoint += value
  when 'W'
    x_waypoint -= value
  when 'F'
    x_ship += x_waypoint * value
    y_ship += y_waypoint * value
  when 'R'
    x_waypoint, y_waypoint = rotate(value, x_waypoint, y_waypoint)
  when 'L'
    x_waypoint, y_waypoint = rotate(-value, x_waypoint, y_waypoint)
  end
end


p x_ship.abs + y_ship.abs