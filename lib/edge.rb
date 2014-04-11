class Edge
  attr_accessor :node_a, :node_b, :weight

  def initialize(node_a, node_b, weight)
    @node_a = node_a
    @node_b = node_b
    @weight = weight
  end
end