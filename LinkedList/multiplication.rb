class Node

  attr_accessor :data, :next

  def initialize(data = nil)
    @data = data
    @next = nil
  end

end

class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def self.length(node = head)
    if node.nil?
      return 0
    end

    1 + length(node.next)
  end

end


class Multiplication

  attr_accessor :list1, :list2, :result, :carry, :add_carry, :factor

  def initialize(list1, list2)
    @list1 = list1
    @list2 = list2
    @carry = 0
    @result = nil
    @add_carry = 0
    @factor = 0
  end

  def compute(node1 = list1.head, node2 = list2.head)
    if node2.nil?
      return
    end

    compute(node1, node2.next)

    p product_list = multiply(node1, node2)

    p "============="

    @factor += 1

    if result.nil?
      @result = product_list
    else
      add_lists(result, product_list)
      if add_carry > 0
        node = Node.new(add_carry)
        node.next = result
        @result = node
        @add_carry = 0
      end
    end

    result
  end


  def add_lists(node1, node2)
    length1 = LinkedList.length(node1)
    length2 = LinkedList.length(node2)

    if length1 < length2
      temp_list = node1
      node1 = node2
      node2 = temp_list
    end

    diff = (length1 - length2).abs

    if diff == 0
      @result = add_lists_util(node1, node2)
    else
      j = 0
      current = node1

      while( j < diff)
        current = current.next
        j += 1
      end

      @result = add_lists_util(current, node2)
      add_carry_to_remaining_list(node1, diff)
    end

    result
  end

  def add_carry_to_remaining_list(node1, diff)
    if diff == 0
      return
    end

    add_carry_to_remaining_list(node1.next, diff - 1)

    sum = node1.data + add_carry
    f_sum = sum%10
    @add_carry = sum/10

    node = Node.new(f_sum)
    node.next = result
    @result = node
  end


  def add_lists_util(node1, node2)
    if node1.nil? and node2.nil?
      return
    end

    result = Node.new
    result.next = add_lists(node1.next, node2.next)

    sum = node1.data + node2.data + add_carry
    result.data = sum%10
    @add_carry = sum/10

    result
  end


  def multiply(node1, node2)
    if node1.nil?
      temp = nil
      if factor > 0
        factor.times.each do |j|
          node = Node.new(0)
          node.next = temp
          temp = node
        end
      end

      return temp
    end

    result = Node.new


    result.next = multiply(node1.next, node2)

    product = node1.data * node2.data + carry
    result.data = product%10
    @carry = product/10

    result
  end


  def self.run
    l1 = LinkedList.new
    l1.head = Node.new 1
    l1.head.next = Node.new 2
    l1.head.next.next = Node.new 3

    l2 = LinkedList.new
    l2.head = Node.new 4
    l2.head.next = Node.new 5
    l2.head.next.next = Node.new 6
    l2.head.next.next.next = Node.new 7
    l2.head.next.next.next.next = Node.new 8

    m = Multiplication.new(l1, l2)
    m.compute(l1.head, l2.head)
  end
end


