def check_ticket(ticket, rules)
  invalid = 0

  ticket.each do |value|
    valid = false
    rules.each do |min, max|
      if value >= min && value <= max
        valid = true
        break
      end
    end

    invalid += value unless valid
  end
  invalid
end


intervals = []
your_ticket = []
other_tickets = []

section = 0
$stdin.each_line do |line|
  if line.strip == ''
    section += 1
    next
  end

  case section
  when 0
    rules = line.sub(/.*\: /, '').split(' or ')
    intervals.push *rules.map{|r| r.split('-').map(&:to_i)}
  when 1
    next if line.strip == 'your ticket:'
    your_ticket = line.strip.split(',').map(&:to_i)
  when 2
    next if line.strip == 'nearby tickets:'
    other_tickets.append line.strip.split(',').map(&:to_i)
  end
end

sum = 0
other_tickets.each do |ticket|
  sum += check_ticket(ticket, intervals)
end

p sum

