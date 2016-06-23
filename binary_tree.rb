#load './binary_tree.rb'

class Node

  attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end
end


class BinaryTree

  attr_accessor :root

  def initialize(data)
    @root = Node.new data
  end


  def inorder(node = root)
    if !node.left.nil?
      inorder(node.left)
    end

    p node.data

    if !node.right.nil?
      inorder(node.right)
    end

  end

  def preorder(node = root)
    p node.data

    if !node.left.nil?
      preorder(node.left)
    end

    if !node.right.nil?
      preorder(node.right)
    end

  end

  def postorder(node = root)
    if !node.left.nil?
      postorder(node.left)
    end

    if !node.right.nil?
      postorder(node.right)
    end

    p node.data
  end

  def height(node = root)
    if node.nil?
      return 0
    end

    lheight = height(node.left)
    rheight = height(node.right)

    if lheight < rheight
      rheight + 1
    else
      lheight + 1
    end
  end


  def bfs
    (1..height).each do |level|
      arr = print_given_level(root, level, [])
      p arr.collect(&:to_s).join(' , ')
    end
  end

  def print_given_level(node, level, array)
    if node.nil?
      return
    end

    if level == 1
      array << node.data
    end

    if level > 1
      print_given_level(node.left, level - 1, array)
      print_given_level(node.right, level - 1, array)
    end

    array
  end

  def inorder_without_recursion(node = root)
    array = []
    array.push node

    while(!array.empty?)
      p array.collect(&:data)
      p "--------"
      node = node.left

      while(!(node).nil?)
        array.push node
        node = node.left
      end

      node = array.pop
      p node.data

      if !node.right.nil?
        node = node.right
        array.push node
      end

    end
  end


  def size(node = root)


    if node.nil?
      return 0
    else
      p node.data
    end    


    size(node.left) + 1 + size(node.right) 
  end


  def self.identical(node1, node2)
    if node1.nil? and node2.nil?
      return true
    elsif node1.nil? or node2.nil?
      return false
    end

    if node1.data == node2.data
      p identical(node1.left, node2.left) and identical(node1.right, node2.right)
    else
      return false
    end
  end

  def self.dummy_tree
    b = BinaryTree.new 1
    root = b.root
    root.left = Node.new 2
    root.left.right = Node.new 5
    root.left.right.left = Node.new 6
    root.right = Node.new 3
    root.right.left = Node.new 7
    root.right.left.left = Node.new 8
    root.right.left.right = Node.new 9
    root.left.left = Node.new 4
    root.left.left.right = Node.new 10

    b
  end

end