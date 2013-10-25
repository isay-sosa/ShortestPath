require_relative 'edge.rb'
require_relative 'node.rb'

describe Edge do
  let(:node_a) { Node.new "A" }
  let(:node_b) { Node.new "B" }
  let(:edge) { Edge.new node_a, node_b, 12 }

  describe "#new" do
    it "should be an instance of Edge" do
      expect(edge).not_to be_nil
      expect(edge).to be_an_instance_of Edge
    end

    it "should link the nodes" do
      expect {
        Edge.new node_a, node_b, 12
      }.to change {node_a.edges.size}.by 1
      expect(node_a.edges.first.node_b).to be node_b
      expect(node_b.edges.size).to be 1
      expect(node_b.edges.first.node_a).to be node_a
    end
  end

  describe "#nodes" do
    context "when node_a is node_a" do
      it "should return node_a as node_a" do
        expect(edge.node_a).to be node_a
      end

      it "should return node_b as node_b" do
        expect(edge.node_b).to be node_b
      end
    end

    context "when node_b is node_a" do
      let(:edge_2) { Edge.new node_b, node_a, 19 }

      it "should return node_b as node_a" do
        expect(edge_2.node_a).to be node_b
      end

      it "should return node_a as node_b" do
        expect(edge_2.node_b).to be node_a
      end
    end
  end

  describe "#weight" do
    it "should return 12 as weight" do
      expect(edge.weight).to be 12
    end
  end
end