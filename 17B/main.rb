def change_value(space, x, y ,z, w)
  offsets = []
  (-1..1).each { |w1| (-1..1).each {|z1| (-1..1).each { |y1| (-1..1).each { |x1| offsets.append([x1,y1,z1,w1]) if x1 != 0 || y1 != 0 || z1 != 0 || w1 != 0}}}}

  cur_value = space[[x,y,z,w]] ? space[[x,y,z,w]] : '.'
  actives = 0
  offsets.each do |x_offset, y_offset, z_offset, w_offset|
    check_x = x + x_offset
    check_y = y + y_offset
    check_z = z + z_offset
    check_w = w + w_offset
    tuple = [check_x, check_y, check_z, check_w]
    actives += 1 if space[tuple] == '#'
  end
  return '#' if cur_value == '#' && (actives == 2 || actives == 3)
  return '#' if cur_value == '.' && actives == 3
  return '.'
end

space = {}

y = 0
max_x=0
$stdin.each_line do |line|
  line.strip.split('').each_with_index do |v, x|
    space[[x,y,0, 0]] = v
    max_x = x if x > max_x
  end
  y +=1
end

min_x = -1
min_y = -1
max_y = y+1
min_z = -1
max_z = 1
min_w = -1
max_w = 1

(0..5).each do |cycle|
  prev_space = space.clone

  (min_w..max_w).each do |cur_w|
    (min_z..max_z).each do |cur_z|
      (min_y..max_y).each do |cur_y|
        (min_x..max_x).each do |cur_x|
          new_value = change_value(prev_space, cur_x, cur_y, cur_z, cur_w)
          space[[cur_x, cur_y, cur_z, cur_w]] = new_value if prev_space[[cur_x, cur_y, cur_z, cur_w]] || new_value == '#'
        end
      end
    end
  end

  min_x -= 1
  max_x += 1
  min_y -= 1
  max_y += 1
  min_z -= 1
  max_z += 1
  min_w -= 1
  max_w += 1
end

p space.values.count('#')