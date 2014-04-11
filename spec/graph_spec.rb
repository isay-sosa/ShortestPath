require 'spec_helper'

describe Graph do
  let(:graph) { Graph.new }

  context '#new' do
    it 'should return an empty hash' do
      expect(graph.empty?).to be_true
    end
  end

  context '#add_node' do
    let(:node) { Node.new 'A' }

    describe 'when node is not in the graph' do
      it 'is added to the graph' do
        expect {
          graph.add_node node
        }.to change { graph.count }.by 1
      end
    end

    describe 'when node is already in the graph' do
      before do
        graph.add_node node
      end

      it 'is not added to the graph' do
        expect {
          graph.add_node node
        }.to change { graph.count }.by 0
      end
    end
  end

  context '#add_nodes' do
    let(:nodes) do
      [
        Node.new('A'),
        Node.new('B'),
        Node.new('C'),
        Node.new('A')
      ]
    end

    it 'adds all the nodes to the graph' do
      expect {
        graph.add_nodes nodes
      }.to change { graph.count }.by 3
    end
  end

  context '#connect' do
    let(:node_a) {Node.new(key: 'A', value: 3)}
    let(:node_b) {Node.new(key: 'B', value: 3)}

    describe 'when nodes are not connected' do
      before do
        node_a.neighbors = []
        node_b.neighbors = []
      end

      it 'makes the connection' do
        graph.connect(node_a, node_b, 8)
        expect(node_a.neighbors.count).to eql 1
        expect(node_b.neighbors.count).to eql 1
      end
    end

    describe 'when nodes are already connected' do
      before do
        graph.connect(node_a, node_b, 8)
      end

      it 'does not make the connection' do
        expect {
          graph.connect(node_a, node_b, 8)
        }.to change { node_a.neighbors.count }.by 0
      end
    end
  end
end