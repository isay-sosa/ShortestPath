class Node
  attr_accessor :key, :visited
  attr_reader :edges  

  def initialize(key)
    @key = key
    @edges = []
    @visited = false
    self.distance = 0
  end

  def add_edge=(value)
    @edges << value if value.instance_of? Edge
  end

  def distance=(value)
    @distance = value if value.class == Fixnum || value.class == Float
  end

  def distance
    @distance
  end

  def from=(node)
    @from = node if node.instance_of? Node
  end

  def from
    @from
  end
end