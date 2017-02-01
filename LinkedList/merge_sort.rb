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

class MergeSort

  attr_accessor :list, :first, :second


  def initialize(list)
    @list = list
  end


  def merge_sort(node = list.head)
    if node.nil? or node.next.nil?
      return node
    end

    first, second = front_back_split(node)

    first = merge_sort(first)
    second = merge_sort(second)

    first = sorted_merge(first, second)
    first
  end

  def sorted_merge(first, second)
    result = nil
    if first.nil?
      return second
    end

    if second.nil?
      return first
    end

    if first.data < second.data
      result = first
      result.next = sorted_merge(first.next, second)
    else
      result = second
      result.next = sorted_merge(first, second.next)
    end

    result
  end

  def front_back_split(node)
    slow = node
    fast = node

    prev = nil

    while(fast and fast.next)
      prev = slow
      slow = slow.next
      fast = fast.next.next
    end

    prev.next = nil
    first = node
    second = slow

    [ first, second ]
  end



  def self.run
    l = LinkedList.new
    l.push(20)
    l.push(2)
    l.push(5)
    l.push(3)
    l.push(1)
    l.push(18)
    l.push(13)
    l.push(10)

    m = MergeSort.new(l)
    m.merge_sort
  end

end
