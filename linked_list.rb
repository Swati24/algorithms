class Node

  attr_accessor :next, :data

  def initialize(data)
    @data = data
    @next = nil
  end
end

class LinkedList

  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end


  def insert_in_front(data)
    node = Node.new(data)
    node.next = @head
    @head = node

    head
  end


  def insert_after_node(parent_node, data)
    node = Node.new(data)

    node.next = parent_node.next
    parent_node.next = node

    head
  end

  def insert_at_end(data)
    temp = head
    while(temp.next)
      temp = temp.next
    end

    temp.next = Node.new(data)

    head
  end

end
