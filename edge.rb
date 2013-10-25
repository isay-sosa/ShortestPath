class Edge
  def initialize(node_a, node_b, weight)
    self.node_a = node_a
    self.node_b = node_b
    self.weight = weight

    link_nodes
  end

  def node_a=(value)
    @node_a = value if value.class == Node
  end

  def node_a
    @node_a
  end

  def node_b=(value)
    @node_b = value if value.class == Node
  end

  def node_b
    @node_b
  end

  def weight=(value)
    @weight = value if value.class == Fixnum || value.class == Float
  end

  def weight
    @weight
  end

  private
  def link_nodes
    if node_a != nil && node_b != nil
      node_a.add_edge = self
      node_b.add_edge = self
    end
  end
end