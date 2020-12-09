line_idx = 0
PREABLE_SIZE = 25
preable_hash = {}
import = []

$stdin.each_line do |line|
  value = line.strip.to_i
  if line_idx < PREABLE_SIZE
    preable_hash[value] = true
    import.append(value)
  else
    found = false
    preable_hash.each_key do |key|
      dif = value - key

      if preable_hash.key? dif
        found = true
        break
      end
    end

    unless found
      p value
      return
    end

    import.append(value)
    preable_hash[value] = true
    preable_hash.delete(import[line_idx-PREABLE_SIZE])
  end

  line_idx += 1
end