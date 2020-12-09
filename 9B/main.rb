line_idx = 0
PREABLE_SIZE = 25
preable_hash = {}
import = []
VALUE = 50047984

$stdin.each_line do |line|
  value = line.strip.to_i
  if line_idx < PREABLE_SIZE
    import.append(value)
  else
    scope = import[line_idx-PREABLE_SIZE..line_idx-1]

    dif = VALUE
    scope.each_with_index do |curr, idx|
      dif -= curr
      break if dif < 0
      if dif == 0
        sequence = scope[0..idx].sort!
        p "#{sequence.first} + #{sequence.last} = #{sequence.first + sequence.last}"
        return
      end
    end

    import.append(value)
  end

  line_idx += 1
end