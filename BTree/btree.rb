class Node

  attr_accessor :leaf, :keys, :degree, :children

  def initialize(degree)
    @degree = degree
    @keys = []
    @children = []
    @leaf = true
  end

  def size
    keys.size
  end

  def leaf?
    leaf == true
  end

  def insert(value)
    i = size - 1

    if leaf?
      while( i >= 0 and keys[i] and keys[i] > value)
        @keys[i+1] = keys[i]
        i -= 1
      end

      keys[i+1] = value

    else

      while(i >= 0 and keys[i] and keys[i] > value)
        i -= 1
      end

      if children[i+1] and children[i+1].full?

      end

      @children[i+1].insert(value)

    end

  end

  def full?
    size >= 2*degree - 1
  end

  def add_child(node)
    @children << node
  end

  def split(child_id)
    splitee = children[child_id]

    y = Node.new(degree)
    z = Node.new(degree)
    z.leaf = splitee.leaf

    (degree - 1).times do |j|
      z.keys[j] = splitee.keys[j + degree]
      y.keys[j] = splitee.keys[j]
    end

    mid_val = splitee.keys[degree - 1]

    @children[child_id + 1] = z
    @children[child_id] = y

    @keys[child_id] = mid_val
  end

end


class Btree

  attr_accessor :root, :degree, :size

  def initialize(degree = 2)
    @degree = degree
    @root = Node.new(degree)
    @root.leaf = true
    @size = 0
  end

  def insert(value = nil)
    node = @root

    if node.full?
      @root = Node.new(degree)
      @root.leaf = false
      @root.add_child(node)
      @root.split(@root.children.size - 1)
      node = @root
    end

    node.insert(value)
    @size += 1
    return self
  end
end
