class Node

  attr_accessor :low, :equal, :high, :value

  def initialize(value)
    @value = value
    @low = nil
    @high = nil
    @equal = nil
  end
end



class TernarySearchTree

  attr_accessor :root

  def initialize(node = nil)
    @root = node
  end


  def insert(node, word, index = 0)
    if word[index].nil?
      return 1
    end

    if node == 1
      node = nil
    end

    if node.nil?
      node = Node.new(word[index])
    end

    self.root = node if @root.nil?

    if word[index] == node.value
      node.equal = insert(node.equal, word, index + 1)
    elsif word[index] < node.value
      temp = Node.new(word[index])
      node.low = temp
      temp.equal = insert(temp.equal, word, index + 1)
    elsif word[index] > node.value
      temp = Node.new(word[index])
      node.high = temp
      temp.equal = insert(temp.equal, word, index + 1)
    end

    node

  end

  def traverse(node, buffer = [])
    if node == 1 or node.nil?
      p buffer.join if node == 1
      return
    end

    buffer << node.value
    traverse(node.equal, buffer)
    buffer.delete(node.value)
    traverse(node.low, buffer)
    traverse(node.high, buffer)
  end





































end
