require_relative 'binary_tree'

describe BTree do
  describe "#depth_first_traversal" do
    it "should traverse in order of smallest to largest" do
      tree = create_tree_with_ordered_values([6, 9, 2, 4, 8])
      string = ""

      tree.depth_first_traversal { |x| string << x.to_s }

      expect(string).to eq("24689")
    end
  end

  describe "#breadth_first_traversal" do
    it "should traverse each layer from left to right" do
      tree = create_tree_with_ordered_values([6, 9, 2, 4, 8])
      string = ""

      tree.breadth_first_traversal { |x| string << x.to_s }

      expect(string).to eq("62948")
    end
  end

  describe "#find" do
    it "should return true if it exists in the tree" do
      tree = create_tree_with_ordered_values([6, 9, 2, 4])

      result = tree.find(2)

      expect(result).to eq(true)
    end

    it "should return false if it does not exist in the tree" do
      tree = create_tree_with_ordered_values([6, 9, 2, 4])

      result = tree.find(5)

      expect(result).to eq(false)
    end
  end

  def create_tree_with_ordered_values(ordered_values)
    tree = BTree.new

    ordered_values.each do |val|
      tree.add(val)
    end

    tree
  end
end
