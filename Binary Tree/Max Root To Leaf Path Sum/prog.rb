class Node

  attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end
end

class Prog

  attr_accessor :root, :array, :max_sum, :leaf

  def initialize(data = nil, node = nil)
    @array = []
    @max_sum = 0
    @root = Node.new data
    @leaf = nil
  end


  def process(node = root, length = 0)
    if node.nil?
      return
    end

    array[length] = node.data
    length += 1

    if node.left.nil? and node.right.nil?
      p array[0, length]

      p sum = array[0, length].inject(:+)
      if sum > max_sum
        @max_sum = sum
        @leaf = node
      end
    end

    process(node.left, length)
    process(node.right, length)

    p max_sum
    p leaf
    p array
  end

  def self.run
    tree = Prog.new(10)
    tree.root.left = Node.new(-2)
    tree.root.left.left = Node.new 8
    tree.root.left.left.right = Node.new 5
    tree.root.left.right = Node.new 8
    tree.root.right = Node.new 7

    tree.process
  end

end
