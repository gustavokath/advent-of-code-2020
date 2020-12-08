pointer = 0
acumulator = 0
executed = {}
program = []

$stdin.each_line do |line|
  program.append(line.strip.split(' '))
end

while !executed.key?(pointer)
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

p acumulator