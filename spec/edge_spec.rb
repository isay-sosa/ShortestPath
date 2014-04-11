require 'spec_helper'

describe Edge do
  context '#new' do
    let(:node_a) { Node.new 'A' }
    let(:node_b) { Node.new 'B' }
    
    it 'should have node A, node B and a weight' do
      e = Edge.new(node_a, node_b, 8)

      expect(e.node_a).to eql node_a
      expect(e.node_b).to eql node_b
      expect(e.weight).to eql 8
    end
  end
end