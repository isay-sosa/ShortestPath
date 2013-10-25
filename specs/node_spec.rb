require_relative 'spec_helper'

describe Node do
  before :each do
    @node = Node.new "A"
  end

  describe "#new" do
    let(:node) { Node.new "A" }

    it "should be an instance of Node" do
      expect(node).not_to be_nil
      expect(node).to be_an_instance_of Node
    end

    it "returns A as key" do
      expect(node.key).to eql "A"
    end

    it "returns empty edges" do
      expect(node.edges).to be_empty
    end

    it "should not be visited yet" do
      expect(node.visited).to be_false
    end

    it "returns 0 as distance" do
      expect(node.distance).to be 0
    end

    it "returns nil as #from" do
      expect(node.from).to be_nil
    end
  end

  describe "#add_edge" do
    it "should add an Edge object" do
      node_b = Node.new "B"      

      expect(@node.edges).to be_empty
      expect(node_b.edges).to be_empty

      e = Edge.new @node, node_b, 10

      expect(@node.edges.size).to be 1
      expect(node_b.edges.size).to be 1
      expect(@node.edges[0]).to be_an_instance_of Edge
      expect(node_b.edges[0]).to be_an_instance_of Edge
    end

    it "should not add a non Edge object" do
      @node.add_edge = 1
      @node.add_edge = "something"
      @node.add_edge = true
      @node.add_edge = nil
      @node.add_edge = Object.new
      @node.add_edge = @node

      expect(@node.edges).to be_empty
    end
  end

  describe "#from" do
    it "should set a node object as value" do
      expect(@node.from).to be_nil

      @node.from = @node

      expect(@node.from).not_to be_nil
      expect(@node.from).to be_an_instance_of Node
    end

    it "should not set a non Node object as value" do
      expect(@node.from).to be_nil

      @node.from = 1
      @node.from = "something"
      @node.from = true
      @node.from = nil
      @node.from = Object.new

      expect(@node.from).to be_nil      
    end
  end

  describe "#distance" do
    it "should set the value" do
      expect(@node.distance). to eq 0

      @node.distance = 12
      expect(@node.distance). to eq 12

      @node.distance = 9.4
      expect(@node.distance). to eq 9.4
    end

    it "should only set numeric values" do
      expect(@node.distance). to eq 0

      @node.distance = true
      @node.distance = "something"
      @node.distance = @node
      @node.distance = nil

      expect(@node.distance). to eq 0
    end
  end
end