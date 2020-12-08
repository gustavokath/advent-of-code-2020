
program = []
prev_pointer = 0

$stdin.each_line do |line|
  program.append(line.strip.split(' '))
end

def execute(program)
  pointer = 0
  acumulator = 0
  executed = {}
  repeat = 0

  while !executed.key? pointer
    return acumulator if pointer >= program.length
    operation, value = program[pointer]
    executed[pointer] = true

    case operation
    when 'acc'
      acumulator += value.to_i
    when 'jmp'
      pointer += value.to_i
      next
    end

    pointer += 1
  end
end

program.each_with_index do |_, idx|
  next if program[idx][0] == 'acc'

  program[idx][0] = program[idx][0] == 'nop' ? 'jmp' : 'nop'
  result = execute(program)
  program[idx][0] = program[idx][0] == 'nop' ? 'jmp' : 'nop'

  if result
    p result
    break
  end
end