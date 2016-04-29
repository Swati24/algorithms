require './node'

class CircularLinkedList
  attr_accessor :head


  def initialize
    @head = nil
  end


  # Push the noe at the beginning of the list
  def push data
    node = Node.new data

    if self.head == nil
      self.head = node
      node.next = node
    else
      temp = self.head
      
      while temp.next != self.head
        temp = temp.next
      end

      temp.next = node
      node.next = self.head
      self.head = node
    end

    self
  end


  def printList
    temp = self.head

    while true
      p temp.data
      temp = temp.next

      if temp == self.head
        break
      end
    end
  end

  def split2Halves
    slow = @head
    fast = @head
    temp = nil

    while(fast.next != @head and fast.next.next != @head)
      fast = fast.next.next
      slow = slow.next
    end

    temp = slow.next

    l1 = CircularLinkedList.new
    l2 = CircularLinkedList.new

    l1.head = @head
    slow.next = @head

    l2.head = temp

    while true
      temp = temp.next

      if temp.next == @head
        break 
      end
    end

    temp.next = l2.head

    l1.printList
    p "----------------"
    l2.printList
  end

  def get_middle
    fast = @head
    slow = @head

    while(fast.next != @head and fast.next.next != @head)
      fast = fast.next.next
      slow = slow.next
    end

    slow
  end 

  def sortedInsert data
    node = Node.new data
    if @head.nil?
      self.head = node
      node.next = self.head
    end

    insert_in_sorted_fashion data
  end

  def insert_in_sorted_fashion
    temp = get_middle

    if data > temp.data
        
    else

    end
  end

  def self.create_dummy
    l = new
    l.push 67
    l.push 34
    l.push 23
    l.push 12
    l.push 10
    l.push 98
    l.push 78
    l.push 88
    l.push 60
    l.push 54
    l.push 46
    l.push 58

    l
  end









































end