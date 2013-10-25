require_relative 'dijkstra.rb'
require_relative 'graph.rb'
require_relative 'edge.rb'
require_relative 'node.rb'

describe Dijkstra do
  let(:graph) { Graph.new }
  
  before do
    graph.add_nodes [ Node.new(1), Node.new(2), Node.new(3), Node.new(4), Node.new(5), Node.new(6) ]
    graph.add_conection graph.g[1], graph.g[2], 7
    graph.add_conection graph.g[1], graph.g[3], 9
    graph.add_conection graph.g[1], graph.g[6], 14
    graph.add_conection graph.g[2], graph.g[3], 10
    graph.add_conection graph.g[2], graph.g[4], 15
    graph.add_conection graph.g[3], graph.g[4], 11
    graph.add_conection graph.g[3], graph.g[6], 2
    graph.add_conection graph.g[4], graph.g[5], 6
    graph.add_conection graph.g[5], graph.g[6], 9
  end

  describe "#make_path" do
    let(:dijkstra) { Dijkstra.new }
    context "when start_node is node_1 and end_node is node_5" do
      it "the path should be 1 => 3 => 6 => 5" do
        expect( dijkstra.make_path(graph.g[1], graph.g[5]) ).to eql "1 => 3 => 6 => 5"
      end
    end
  end
end