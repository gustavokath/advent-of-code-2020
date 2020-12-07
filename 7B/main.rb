class Node
  attr_accessor :name, :quantity

  def initialize(name, quantity)
    @name = name
    @quantity = quantity
  end
end

def goldChild(tree, memory, current)
  return 1 if tree[current] == []
  return memory[current] if memory.key? current

  total = 0
  tree[current].each do |node|
    result = goldChild?(tree, memory, node.name)
    memory[node.name] = result
    total += result * node.quantity
  end

  return total + 1
end

tree = {}
memory = {}

$stdin.each_line do |line|
  source, childs = line.strip.split('contain')
  source = source.strip[0..-5].strip

  if childs.strip == 'no other bags.'
    tree[source] = []
    next
  end

  childs = childs.strip.split(',').map do |entry|
    number, bag_adj, bag_color = entry.strip.split(' ')
    Node.new("#{bag_adj} #{bag_color}", number.to_i)
  end

  tree[source] = childs
end

p goldChild(tree, memory, 'shiny gold')-1

