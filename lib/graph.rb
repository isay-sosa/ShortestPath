class Graph < Hash
  def initialize
    super
  end

  def add_node(node)
    self[node.key] = node if !self.include?(node.key)
  end

  def add_nodes(nodes = [])
    nodes.each {|n| add_node n}
  end

  def connect(node_a, node_b, weight)
    connect_nodes(node_a, node_b, weight)
    connect_nodes(node_b, node_a, weight)
  end

  def add_and_connect_nodes(node_a, node_b, weight)
    add_nodes [node_a, node_b]
    connect node_a, node_b, weight
  end

  private
  def connect_nodes(node_a, node_b, weight)
    node_a.neighbors << Edge.new(node_a, node_b, weight) if node_a.neighbors.select { 
      |con| node_a == con.node_a && node_b == con.node_b && weight == con.weight
    }.empty?
  end
end