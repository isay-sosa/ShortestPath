class Dijkstra
  def make_path(start_node, end_node)
    @start_node = start_node
    @end_node = end_node
    examin_neighbors_and_update_distance @start_node
    print_route @end_node
  end

  private
  def examin_neighbors_and_update_distance(node)
    neigh_with_less_weight = nil

    node.edges.each do |edge|
      node_origin, node_destination = whos_origin_and_whos_destination(node, edge)

      unless node_destination.visited
        if (node_destination.distance > node_origin.distance + edge.weight) || (node_destination.distance == 0)
          node_destination.distance = node_origin.distance + edge.weight
          node_destination.from = node
          neigh_with_less_weight = node_destination if neigh_with_less_weight.nil? || neigh_with_less_weight.distance > node_destination.distance
        else
          neigh_with_less_weight = node_destination
        end
      end
    end

    node.visited = true
    unless neigh_with_less_weight.nil?
      if neigh_with_less_weight != @end_node
        examin_neighbors_and_update_distance(neigh_with_less_weight)
      else
        neigh_with_less_weight.visited = true
      end
    end
  end

  def whos_origin_and_whos_destination(current_node, edge)
    if current_node == edge.node_a
      [edge.node_a, edge.node_b]
    else
      [edge.node_b, edge.node_a]
    end
  end

  def print_route(node)
    if !node.from.nil?
      route = "#{print_route(node.from)} => #{node.key}"
    else
      route = "#{@start_node.key}"
    end
  end
end
