require 'set'

def check_ticket(ticket, rules)
  ticket.each do |value|
    valid = false
    rules.each do |min, max|
      if value >= min[0] && value <= min[1] || value >= max[0] && value <= max[1]
        valid = true
        break
      end
    end

    return false unless valid
  end
  true
end


intervals = []
your_ticket = []
other_tickets = []

categories = {}

section = 0
$stdin.each_line do |line|
  if line.strip == ''
    section += 1
    next
  end

  case section
  when 0
    rules = line.sub(/.*\: /, '').split(' or ')
    intervals.push *[rules.map{|r| r.split('-').map(&:to_i)}]
  when 1
    next if line.strip == 'your ticket:'
    your_ticket = line.strip.split(',').map(&:to_i)
  when 2
    next if line.strip == 'nearby tickets:'
    ticket = line.strip.split(',').map(&:to_i)
    other_tickets.append ticket if check_ticket(ticket, intervals)
  end
end

(0..intervals.length-1).each { |id| categories[id] = Set.new(0..your_ticket.length-1) }

intervals.each_with_index do |rules, idx|
  rule1, rule2 = rules
  other_tickets.each do |ticket|
    ticket.each_with_index do |value, pos|
      next unless categories[idx].include? pos

      if !(value >= rule1[0] && value <= rule1[1] || value >= rule2[0] && value <= rule2[1])
        categories[idx].delete(pos)
      end
    end
  end
end

used = {}
order = {}
categories = categories.sort_by { |category, pos| pos.size }

categories.each do |cat_id, possibilities|
  possibilities.filter! { |v| !used.key? v }
  selected = possibilities.to_a.first
  used[selected] = true
  order[cat_id] = selected
end

res = 1
(0..5).each { |cat_id| res *= your_ticket[order[cat_id]] }

p res


