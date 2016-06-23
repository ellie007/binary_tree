class BTree
  attr_accessor :value, :parent, :left_child, :right_child

  def initialize(value=nil, parent=nil)
    @value = value
    @parent = parent
  end

  # TODO: Implement a smart search, ie, O(log n)
  def find(val)
    if self.value == val
      return true
    else
      self.value > val ? prune(self.left_child, val) : prune(self.right_child, val)
    end
  end

  def prune(branch, val)
    if branch.nil?
      return false
    elsif branch.value == val
      return true
    elsif branch.value > val
      prune(branch.left_child, val)
    elsif branch.value < val
      prune(branch.right_child, val)
    end
  end

  def breadth_first_traversal(&block)
    queue = []
    queue.push(self)

    while !queue.empty?
      current_node = queue.shift
      block.call(current_node.value)
      if current_node.left_child || current_node.right_child
        queue.push(current_node.left_child) if current_node.left_child
        queue.push(current_node.right_child) if current_node.right_child
      end
    end
  end

  ##### Our Code #######

  def add(value)
    if @value.nil?
      @value = value
    elsif value < @value
      if @left_child.nil?
        @left_child = BTree.new(value, self)
      else
        @left_child.add(value)
      end
    elsif value > @value
      if @right_child.nil?
        @right_child = BTree.new(value, self)
      else
        @right_child.add(value)
      end
    end
  end

  def depth_first_traversal(&block)
    left_child.depth_first_traversal(&block) if left_child
    block.call(value) if value
    right_child.depth_first_traversal(&block) if right_child
  end
end
