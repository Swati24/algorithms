class Node

  attr_accessor :data, :left, :right

  def initialize data
    @data = data
    @left = nil
    @right = nil
  end

end

class BinaryTree

  attr_accessor :root

  def initialize data
    @root = Node.new data
  end

  def inorder(node = self.root)
    if node.left
      inorder node.left
    end

    p node.data

    if node.right
      inorder node.right
    end
  end

  def preorder(node = self.root)
    p node.data

    if node.left
      preorder node.left
    end

    if node.right
      preorder node.right
    end
  end

  def postorder(node = self.root)
    if node.left
      postorder node.left
    end

    if node.right
      postorder node.right
    end

    p node.data
  end

  def level_order_traversal
    (1..self.height).each do |level|
      print_level_order_node self.root, level
      p "----------"
    end
  end

  def print_level_order_node node, level
    return if node.nil?

    if level == 1
      p node.data 
    elsif level > 1
      print_level_order_node node.left, level - 1
      print_level_order_node node.right, level - 1
    end
  end

  def height(node = self.root)
    if node.nil?
      return 0
    end

    lheight = height node.left
    rheight = height node.right

    if lheight > rheight
      return lheight + 1
    else
      return rheight + 1
    end
  end


  def children_sum_property(node = self.root)
    if node.nil? or node.left.nil? and node.right.nil?
      p '----Case 1----'
      p node.data
      return true
    elsif !node.left.nil? or !node.right.nil?
      p '----Case 3----'
      p left = node.left.data rescue 0
      p right = node.right.data rescue 0
      p (node.data == left + right) and children_sum_property(node.left) and children_sum_property(node.right)
    end
  end

  def convert_to_children_sum_property_tree(node = self.root)
    if node.nil? or (node.left.nil? and node.right.nil?)
      return
    else
      if node.left
        convert_to_children_sum_property_tree node.left
      end

      if node.right
        convert_to_children_sum_property_tree node.right
      end

      node.data = (node.left.data rescue 0) + (node.right.data rescue 0)
    end

    self.inorder
  end

  def self.create_dummy
    b = BinaryTree.new 1
    root = b.root
    root.left = Node.new 2
    root.right = Node.new 3
    root.left.left = Node.new 4
    root.left.right = Node.new 5

    b
  end
end

