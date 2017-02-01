class Node

  attr_accessor :data, :left, :equal, :right

  def initialize(data)
    @data = data
    @left = nil
    @equal = nil
    @right = nil
  end
end

class TernaryTree

  attr_accessor :root

  def initialize
    @root = nil
  end


  def insert(word, node = root, index = 0)
    if node == 1
      node = nil
    end

    if node.nil?
      node = Node.new(word[index])
      @root = node if root.nil?
    end

    if word[index] < node.data
      temp = node.left and node.left.data == word[index] ? node.left : nil
      node.left = insert(word, temp, index)
    elsif word[index] > node.data
      temp = (node.right and node.right.data == word[index]) ? node.right : nil
      node.right = insert(word, temp, index)
    else
      if word[index + 1]
        node.equal = insert(word, node.equal, index + 1)
      else
        node.equal = 1
      end
    end

    node

  end

  def traverse(node = root, buffer = [], index = 0)
    return if node.nil?

    traverse(node.left, buffer, index)

    buffer[index] = node.data
    if node == 1
      p buffer.join if node == 1
      return
    end

    traverse(node.equal, buffer, index + 1)
    traverse(node.right, buffer, index)
  end



end
