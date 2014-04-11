class Dijkstra
  def shortest_path(start_node, end_node)
    iterator(start_node, end_node)
    print_path(end_node)
  end

  private
  def iterator(start_node, end_node)
    return if start_node == end_node
    start_node.is_enable = false
    iterator(min_neighbor(start_node), end_node)
  end

  def min_neighbor(parent_node)
    parent_node.neighbors.inject([]) do |actives, con|
      if con.node_b.enabled?
        sum_neighbor_value con
        actives << con.node_b
      end
      actives
    end.min_by {|node| node.value}
  end

  def sum_neighbor_value(connection)
    sum = connection.node_a.value + connection.weight
    if !connection.node_b.procedence || connection.node_b.value > sum
      connection.node_b.value = sum
      connection.node_b.procedence = connection.node_a
    end
  end

  def print_path(node)
    return "#{print_path(node.procedence)} => #{node.key}" if node.procedence
    "#{node.key}"
  end
end
