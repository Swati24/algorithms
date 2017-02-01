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
    if head.nil?
      @head = Node.new(data)
    else

      temp = head
      while(temp.next)
        temp = temp.next
      end

      temp.next = Node.new(data)

      head
    end
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

  def get_nth_node(position, node = head, index = 0)
    if node.nil?
      return false
    end

    if position == index
      return node.data
    end

    get_nth_node(position, node.next, index + 1)
  end

  def occurences(value, node = head)
    if node.nil?
      return 0
    end

    if node.data == value
      1 + occurences(value, node.next)
    else
      occurences(value, node.next)
    end

  end

  def middle(first = head, second = head.next)
    if second.nil? or second.next.nil?
      return first
    end

    middle(first.next, second.next.next)
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

  def reverse_using_another_linked_list(l = LinkedList.new, node = head)
    if node.nil?
      return l
    end
    l.insert_in_front(node.data)
    reverse(l, node.next)
  end


  def reverse(curr = head, prev = nil)
    if curr.nil?
      @head = prev
      return @head
    end

    temp = curr.next
    curr.next = prev

    reverse(temp, curr)
  end

  def self.merge_sorted_lists(node1, node2)
    if node1.nil?
      return node2
    elsif node2.nil?
      node1
    end

    if node1.data <= node2.data
      result = node1
      result.next = merge_sorted_lists(node1.next, node2)
    else
      result = node2
      result.next = merge_sorted_lists(node1, node2.next)
    end

    result
  end

  def insert_in_sorted_way(value, curr = head, prev = nil)
    temp = Node.new(value)

    if curr.nil?
      @head = temp
      return @head
    end

    if value < curr.data
      if !prev.nil?
        prev.next = temp
      else
        @head = temp
      end
      temp.next = curr
      return head
    end

    insert_in_sorted_way(value, curr.next, curr)
  end

  def print_reverse(node = head)
    if node.nil?
      return
    end
    print_reverse(node.next)

    p node.data
  end

  def remove_duplicates(node = head, prev_value = nil)
    if node.nil?
      return
    end

    node.next = remove_duplicates(node.next, node.data)

    if prev_value.nil? or prev_value < node.data
      node
    else
      node.next
    end
  end

  def swap_2(node = head, prev = nil)
    if node.nil? or node.next.nil?
      return head
    end

    temp = node.next.next
    curr = node.next
    curr.next = node1
    node.next = temp

    if prev.nil?
      @head = curr
    else
      prev.next = curr
    end

    swap_2(node.next, node)
  end

  def self.intersection(node1, node2)
    if node1.nil? or node2.nil?
      return
    end

    if node1.data < node2.data
      return intersection(node1.next, node2)
    elsif node2.data < node1.data
      return intersection(node1, node2.next)
    end

    temp = Node.new(node1.data)
    temp.next = intersection(node1.next, node2.next)

    temp
  end

  def delete_alternate_nodes(node = head)
    if node.nil? or node.next.nil?
      return node
    end

    node.next = delete_alternate_nodes(node.next.next)

    node
  end

  # Fix this
  def alternate_lists(node = head, l1, l2)
    if node.nil? or node.next.nil?
      return node
    end

    temp = Node.new(node.data)
    temp.next = alternate_lists(node.next.next, l1, l2)

    if node.nil? or node.next.nil? or node.next.next.nil?
      return node
    end

    temp1 = Node.new(node.next.data)
    temp1.next = alternate_lists(node.next.next.next, l1, l2)

    l1.head = temp
    l2.head = temp1
  end

  def self.identical(node1, node2)
    if (node1.nil? and !node2.nil?) or (!node1.nil? and node2.nil?)
      return false
    elsif node1.nil? and node2.nil?
      return true
    end

    node1.data == node2.data and identical(node1.next, node2.next)
  end


  def reverse_in_groups(k, node = head)
    curr = node
    prev = nil
    temp = nil
    index = 0
    while(index < k and curr)
      temp = curr.next
      curr.next = prev
      prev = temp

      index += 1
    end

    if temp.nil?
      node.next = reverse_in_groups(k, temp.next)
    end

    node
  end

  def delete_notes_with_greater_value_on_right(node = head, prev = nil)
    if node.nil? or node.next.nil?
      return head
    end

    temp = node.next
    if node.data < temp.data
      if prev.nil?
        @head = temp
      else
        prev.next = temp
      end

      p head
    else
      prev = node
    end

    delete_notes_with_greater_value_on_right(temp, prev)
  end

  def even_before_odd(node = head, prev = nil, start_node = nil)
    if node.nil?
      return @head
    end

    if node.data % 2 != 0
      return even_before_odd(node.next, node, start_node)
    end

    if prev.nil? or (prev == start_node)
      return even_before_odd(node.next, node, node)
    end

    if start_node.nil?
      temp = head
      @head = node
    else
      temp = start_node.next
      start_node.next = node
    end

    prev.next = node.next
    node.next = temp
    even_before_odd(node.next, node, node)
  end

  def self.add_2_numbers(node1, node2, carry = 0)
    if node1.nil? and node2.nil?
      return
    end

    data_1 = node1.data rescue 0
    data_2 = node2.data rescue 0

    sum = data_1 + data_2 + carry
    sum, carry = sum >= 10 ? [sum % 10, sum/10] : [sum , 0]
    node = Node.new(sum)


    if node1.nil? and !node2.nil?
      node.next = add_2_numbers(node1.next, nil, carry)
    elsif !node1.nil? and node2.nil?
      node.next = add_2_numbers(node1.next, nil, carry)
    else
      node.next = add_2_numbers(node1.next, node2.next, carry)
    end

    node
  end

  def rotate(k, node = head, prev = nil, index = 0)
    if node.nil?
      return nil
    end

    if index == k
      if head.nil?
        return
      end

      if head == node
        return head
      end

      temp = node
      while(!temp.next.nil?)
        temp = temp.next
      end

      temp.next = head
      @head = node
      prev.next = nil

      return @head
    end

    rotate(k, node.next, node, index + 1)

  end


  # TODO - Complete this
  def self.add_2_numbers_from_start(list1, list2)
    node, carry = add_lists_from_start(list1.head, list2.head)
    if !carry.nil?
      temp = Node.new carry
      temp.next = node
      node = temp
    end

    node
  end

  def self.add_lists_from_start(node1, node2)
    if node1.nil? and node2.nil?
      return
    end

    node = Node.new ''
    node.next, carry = add_lists_from_start(node1.next, node2.next)

    if carry.nil?
      carry = 0
    end

    sum = node1.data + node2.data + carry
    sum, carry = sum >= 10 ? [sum % 10, sum/10] : [sum , 0]

    node.data = sum
    return [node, carry]
  end

  def delete_n_nodes_after_m_nodes(m, n, node = head, index = 0)
    if node.nil?
      return
    end

    if index != 0 and index % m == 0
      start_ptr = 0
      while(start_ptr < n)
        return if node.nil?
        node = node.next
        start_ptr += 1
      end
      index = 0
    end

    return if node.nil?

    node.next = delete_n_nodes_after_m_nodes(m, n, node.next, index + 1)
    node
  end

  # TODO
  def self.merge_2_lists_at_alternate_positions(node1, node2, length, index = 0, ptr = 0)
    if node1.nil?
      return
    end

    node = ptr == 0 ? node1 : node2
    p node

    if ptr == 0
      node1 = node1.next
      node2 = node2
    else
      node1 = node1
      node2 = node2.next
    end

    ptr = ptr == 0 ? 1 : 0

    merge_2_lists_at_alternate_positions(node1, node2, length, index + 1, ptr)

    node
  end

  def self.maximum_sum_linked_list(node1, node2, sum1, sum2)
    if node1.nil? and node2.nil?
      return
    end


    p node_data = sum1 >= sum2 ? node1.data : node2.data
    node = Node.new node_data
    node.next = maximum_sum_linked_list(node1.next, node2.next, sum1 - node1.data, sum2 - node2.data)

    p node
    node
  end

  def swap_nodes(val1, val2)
    curr1 = head
    prev1 = nil

    while (curr1.data != val1 and curr1)
      prev1 = curr1
      curr1 = curr1.next
    end

    curr2 = head
    prev2 = nil

    while (curr2.data != val2 and curr2)
      prev2 = curr2
      curr2 = curr2.next
    end

    prev1.next = curr2
    temp = curr2.next
    curr2.next = curr1.next

    prev2.next = curr1
    curr1.next = temp

    head
  end

  def nth_node_from_end(n)
    slow = head
    fast = head

    index = 1

    while(index < n and fast)
      fast = fast.next
      index += 1
    end

    p fast

    while(fast and fast.next)
      slow = slow.next
      fast = fast.next
    end

    slow
  end

  def self.intersection_of_2_sorted_linked_list(node1, node2)
    if node1.nil? or node2.nil?
      return
    end

    if node1.data < node2.data
      return intersection_of_2_sorted_linked_list(node1.next, node2)
    elsif node1.data > node2.data
      return intersection_of_2_sorted_linked_list(node1, node2.next)
    end

    result = Node.new node1.data
    result.next = intersection_of_2_sorted_linked_list(node1.next, node2.next)

    result
  end

  def divide_list(slow = node)
    fast = slow.next

  end


  def merge_sort(node = head)
    if node.nil? or node.next.nil?
      return node
    end

    middle = self.middle(node, node.next)
    temp = middle.next
    middle.next = nil

    first = node
    second = temp

    first = merge_sort(first)
    p "First List -"
    p first
    second = merge_sort(second)
    p "Second List -"
    p second
    p "===================="

    first = LinkedList.sorted_merge(first, second)

    return first

  end

  def self.sorted_merge(node1, node2)
    if node1.nil? and node2.nil?
      return
    end

    if node1.nil?
      node = Node.new(node2.data)
      node.next = sorted_merge(nil, node2.next)
    elsif node2.nil?
      node = Node.new(node1.data)
      node.next = sorted_merge(node1.next, nil)
    elsif node1.data <= node2.data
      node = Node.new(node1.data)
      node.next = sorted_merge(node1.next, node2)
    elsif node1.data > node2.data
      node = Node.new(node2.data)
      node.next = sorted_merge(node1, node2.next)
    end


    node
  end


  def swap_nodes_2(node = head)
    if node.nil? or node.next.nil?
      return node
    end

    p "=========="
    p next_node = node.next
    p temp = next_node.next
    p next_node.next = node

    if head == node
      @head = next_node
    end

    p node.next = swap_nodes_2(temp)

    next_node
  end

  def add_1(node = head, carry = 0, add = 1)
    if node.nil?
      return
    end

    if node.next
      carry, add = add_1(node.next)
    end

    p result = node.data + add + carry

    if result >= 10
      node.data = result % 10
      carry = 1
    else
      node.data = result
      carry = 0
    end

    p carry
    p node

    [carry, 0]
  end

  def reverse_2(node = head)
    if node.nil?
      return
    end

    node.next = reverse_2(node.next)
  end


  def self.create_dummy
    l = LinkedList.new
    a = l.head = Node.new 1
    (2..7).to_a.each do |data|
      a = a.next = Node.new data
    end

    l
  end

  def reverse_at_nth_position(n, node = head, index = 1)
    if node.nil?
      return
    end

    while(index <= n)
      node = node.next
      index += 1
    end

    node.next = reverse_at_nth_position(n, node.next, index)

    p node

    node

  end

  def print
    temp = head

    while(!temp.nil?)
      p temp.data
      temp = temp.next
    end
  end

end
