class Node
  attr_accessor :name, :quantity

  def initialize(name, quantity)
    @name = name
    @quantity = quantity
  end
end

def goldChild?(graph, memory, current, not_visited, found)
  return false if graph[current] == []
  return true if memory[current] == true

  not_visited.delete(current)
  return true if current == 'shiny gold'

  graph[current].each do |node|
    if goldChild?(graph, memory, node.name, not_visited, found)
      memory[node.name] = true
      found[current] = true
    end
  end

  return found.key?(current)
end

graph = {}
not_visited = {}
found = {}
memory = {}


$stdin.each_line do |line|
  source, childs = line.strip.split('contain')
  source = source.strip[0..-5].strip

  if childs.strip == 'no other bags.'
    graph[source] = []
    next
  end

  childs = childs.strip.split(',').map do |entry|
    number, bag_adj, bag_color = entry.strip.split(' ')
    Node.new("#{bag_adj} #{bag_color}", number.to_i)
  end

  graph[source] = childs
  not_visited[source] = true
end

count = 0
while !not_visited.empty?
  key, value = not_visited.first
  goldChild?(graph, memory, key, not_visited, found)
end

p found.size

