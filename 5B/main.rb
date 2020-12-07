def calc_value(min, max)
  (max - min) / 2.0
end


def seatID(line)
  line = line.split('')
  min_row = 0
  max_row = 127
  min_seat = 0
  max_seat = 7
  line.each do |letter|
    if letter == 'F'
      max_row -= calc_value(min_row, max_row).ceil
    elsif letter == 'B'
      min_row += calc_value(min_row, max_row).floor
    elsif letter == 'L'
      max_seat -= calc_value(min_seat, max_seat).ceil
    else
      min_seat += calc_value(min_seat, max_seat).floor
    end
  end

  max_row * 8 + max_seat
end

seats = Array.new(1024, false)
$stdin.each_line do |line|
  value = seatID(line.chomp)
  seats[value] = true
end

for i in 1..1022
  p i if !seats[i] && seats[i-1] && seats[i+1]
end

