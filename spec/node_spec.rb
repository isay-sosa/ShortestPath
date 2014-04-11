require 'spec_helper'

describe Node do
  context '#new' do
    it 'procedence, visited? and neighbors should be nil, false and empty' do
      n = Node.new('A')
      expect(n.procedence).to be_nil
      expect(n.enabled?).to be_true
      expect(n.neighbors.empty?).to be_true
    end
  end

  context '#neighbors' do
    let(:node) {Node.new('A')}
    let(:node_b) {Node.new('B')}

    it 'returns all the neighbors' do
      expect {
        node.neighbors << Edge.new(node, node_b, 3)
      }.to change { node.neighbors.count }.by 1
    end
  end
end