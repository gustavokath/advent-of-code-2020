def extract_masks(mask, mem_idx)
  result = []

  (mask.length-1).downto(0) do |idx|
    if mask[idx] != '0'
      result.append(mask[idx])
    else
      result.append(mem_idx.to_i % 2 == 0 ? '0' : '1' )
    end

    mem_idx = mem_idx / 2
  end

  result.reverse
end

def sumup(mask, i, current, mem, value)
  size = mask.length-1
  if i > size
    mem[current] = value
    return
  end

  if mask[i] == 'X'
    sumup(mask, i+1, current, mem, value)
    sumup(mask, i+1, current + (2**(size-i)), mem, value)
  elsif mask[i] == '1'
    sumup(mask, i+1, current + (2**(size-i)), mem, value)
  else
    sumup(mask, i+1, current, mem, value)
  end
end

mask = []
mem = {}
mask_1 = 0
mask_0 = 0
$stdin.each_line do |line|
  if line.start_with?('mask')
    mask = line.delete_prefix('mask = ').strip.split('')
  else
    idx, value = line.split(' = ')
    idx = idx[/\d+/].to_i
    value = value.to_i
    idx_mask = extract_masks(mask, idx)
    sumup(idx_mask, 0, 0, mem, value)
  end
end

p mem.values.reduce(:+)