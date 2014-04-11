require 'spec_helper'

describe Dijkstra do
  let(:graph) { Graph.new }
  let(:dijkstra) { Dijkstra.new }

  before do
    graph.add_and_connect_nodes Node.new('1'), Node.new('2'), 7
    graph.add_and_connect_nodes graph['1'], Node.new('3'), 9
    graph.add_and_connect_nodes graph['1'], Node.new('6'), 14
    graph.add_and_connect_nodes graph['2'], graph['3'], 10
    graph.add_and_connect_nodes graph['2'], Node.new('4'), 15
    graph.add_and_connect_nodes graph['3'], graph['4'], 11
    graph.add_and_connect_nodes graph['3'], graph['6'], 2
    graph.add_and_connect_nodes graph['4'], Node.new('5'), 6
    graph.add_and_connect_nodes graph['5'], graph['6'], 9
  end

  context '#shortest_path' do
    describe 'when start_node is 1 and end_node is 5' do
      it 'shortest path is 1 => 3 => 6 => 5' do
        expect(dijkstra.shortest_path(graph['1'], graph['5'])).to eql("1 => 3 => 6 => 5")
      end
    end

    describe 'when start_node is 5 and end_node is 1' do
      it 'shortest path is 5 => 6 => 1' do
        expect(dijkstra.shortest_path(graph['5'], graph['1'])).to eql("5 => 6 => 1")
      end
    end
  end
end