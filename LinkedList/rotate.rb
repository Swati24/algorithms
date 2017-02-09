class Node
  attr_accessor :next, :data

  def initialize(data)
    @data = data
    @next = nil
  end
end


class LinkedList

  attr_accessor :head

  def initialize
    @head = nil
  end


  def push(data)
    new_node = Node.new(data)

    temp = head

    if temp.nil?
      @head = new_node
      return head
    end

    while(temp.next)
      temp = temp.next
    end

    temp.next = new_node

    return head
  end

  def print
    temp = head

    while(temp)
      p temp.data
      temp = temp.next
    end

    return head
  end


end

class Rotate

  attr_accessor :list, :k, :head


  def initialize(list, k)
    @list = list
    @k = k
    @head = list.head
  end


  def rotate(node = head, count = 0)
    if node.nil?
      return false
    end

    count += 1
    if count < k
      rotate(node.next, count)
    else

      prev = node
      curr = node.next
      while(node.next != nil)
        node = node.next
      end

      node.next = head
      @head = curr

      prev.next = nil

      return head
    end
  end


  def self.run
    l = LinkedList.new
    l.push(10)
    l.push(20)
    l.push(30)
    l.push(40)
    l.push(50)
    l.push(60)

    m = Rotate.new(l, 2)
    m.rotate
  end
end

class MergeAlternate

  attr_accessor :head1, :head2


  def initialize(list1, list2)
    @head1 = list1.head
    @head2 = list2.head
  end


  def merge(node1 = head1, node2 = head2)
    if node1.nil? or node2.nil?
      return head1
    end

    temp = node1.next
    node1.next = node2

    @head2 = node2.next
    node2.next = temp

    merge(node1.next.next, head2)
  end


  def self.run

    l1 = LinkedList.new
    l1.push(1)
    l1.push(2)
    l1.push(3)

    l2 = LinkedList.new
    l2.push(4)
    l2.push(5)
    l2.push(6)
    l2.push(7)
    l2.push(8)

    m = MergeAlternate.new(l1, l2)
    m.merge
  end
end
