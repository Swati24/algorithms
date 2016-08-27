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

  def delete_by_value(value)
    temp = head
    prev = temp
    while(!temp.nil?)
      if temp.data == value
        prev.next = temp.next
        break
      end
      prev = temp
      temp = temp.next
    end

    head
  end

  def delete_by_position(pos)
    temp = head
    prev = nil
    index = 0
    while(!temp.nil?)
      if index == pos
        prev.nil? ? @head = temp.next : prev.next = temp.next
        break
      end
      prev = temp
      temp = temp.next
      index += 1
    end

    head
  end

  def length(node = head)
    if node.nil?
      return 0
    end

    1 + length(node.next)
  end

  def swap_nodes(val1, val2)

    if val1 == val2
      return head
    end

    temp = head
    curr1 = temp
    curr2 = temp
    prev1 = nil
    prev2 = nil

    while(!temp.nil?)
      if curr1.data != val1
        prev1 = temp
        curr1 = temp.next
      end

      if curr2.data != val2
        prev2 = temp
        curr2 = temp.next
      end

      temp = temp.next
    end

    if curr1.nil? or curr2.nil?
      return false
    end

    if !prev1.nil?
      prev1.next = curr2
    else
      self.head = curr2
    end


    if !prev2.nil?
      prev2.next = curr1
    else
      self.head = curr1
    end

    p self.head

    temp = curr1.next
    curr1.next = curr2.next
    curr2.next = temp


    head
  end

  def search(value, node = head)
    if node.nil?
      return false
    end

    if value == node.data
      return true
    end

    search(value, node.next)
  end

  def print
    temp = head

    while(!temp.nil?)
      p temp.data
      temp = temp.next
    end
  end

end
