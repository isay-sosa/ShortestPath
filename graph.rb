class Graph
  attr_accessor :g

  def initialize
    @g = {}
  end

  def add_node(node)
    @g[node.key] = node
  end

  def add_nodes(nodes = [])
    nodes.each { |node| add_node node }
  end

  def add_conection(node_origin, node_destination, cost)
    @g[node_origin.key] = node_origin if @g[node_origin.key].nil?
    @g[node_destination.key] = node_destination if @g[node_destination.key].nil?
    Edge.new(node_origin, node_destination, cost)
  end
end