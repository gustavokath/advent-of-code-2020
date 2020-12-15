def extract_masks(string_mask)
  mask = string_mask.split('')
  mask_1 = 0
  mask_0 = 0

  size = mask.length-1
  mask.each_with_index do |v, i|
    mask_1 += 2**(size-i) if v == '1'
    mask_0 += 2**(size-i) if v != '0'
  end

  return mask_1, mask_0
end

mem = {}

mask_1 = 0
mask_0 = 0
$stdin.each_line do |line|
  if line.start_with?('mask')
    mask_1, mask_0 = extract_masks(line.delete_prefix('mask = ').strip)
  else
    idx, value = line.split(' = ')
    idx = idx[/\d+/].to_i
    value = value.to_i
    mem[idx] = (value | mask_1) & mask_0
  end
end

p mem.values.reduce(:+)