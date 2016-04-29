require 'node'

class LinkedList

	attr_accessor :head, :tail

	def initialize(head = nil)
		@head = head
		@tail = head
	end

	def push(data)
		new_node = Node.new(data)
		
		if @head.nil?
			@head = new_node
		else
			@tail.next = new_node
		end
		@tail = new_node
	end


	def reverseList
		prev = @head
		current = @head.next

		prev.next = nil
		while(current)
			lnext = current.next
			current.next = prev
			prev = current
			current = lnext
		end
		
		@tail = @head
		@head = prev

		self.printList
		self
	end

	def reverse_partial(k = 3)
		index = 0
		head = temp = @head

		new_list = LinkedList.new

		while temp
			index += 1
			temp = temp.next
			if(index % k == 0)
				list = LinkedList.new head
				head = temp.next
				temp.next = nil
				new_list.mergeList list.reverseList
				temp = head
			end
		end

		new_list.printList
	end


	def mergeList(list)
		temp = list.head
		while(temp)
			self.push temp.data
			temp = temp.next
		end

		self
	end

	def merge_sorted_lists(l1, l2)
		temp1 = l1.head
		temp2 = l2.head

		while(temp1 or temp2)
			if temp1.nil? and !temp2.nil?
				temp2 = moveNode(temp2)	
			elsif temp2.nil? and !temp1.nil?
				temp1 = moveNode(temp1)
			elsif temp1.data < temp2.data
				temp1 = moveNode(temp1)
			elsif temp1.data > temp2.data
				temp2 = moveNode(temp2)
			end
		end
		
		p "----------------"
		
		self.printList
		self
	end

	def printList
		temp = @head
		while(temp)
			p temp.data
			temp = temp.next
		end

		self
	end

	def find_middle
		second = first = @head
		while(second.next != nil and second.next.next != nil)
			first = first.next
			second = second.next.next
		end
		first
	end

	def merge_sort
		temp = @head
		if temp == nil or temp.next == nil
			return self
		end
		l1, l2 = self.divide_list
		LinkedList.new.merge_sorted_lists(l1.merge_sort, l2.merge_sort)
	end

	def divide_list
		temp = @head	
		if temp.next == nil
			return LinkedList.new(temp)
		end
		
		middle_node = self.find_middle
		
		l1 = LinkedList.new(temp)
		l2 = LinkedList.new(middle_node.next)
		
		middle_node.next = nil		

		[l1, l2]
	end

	def length
		temp = @head
		count = 0
		while(temp)
			count += 1
			temp = temp.next
		end
		count
	end

	def add_list(list1)
		p "Starting Adding"
		self.printList
		p "-----------------"
		list1.printList
		p "--------------"
		temp = self.head
		temp1 = list1.head

		sum = []
		carry = 0
		
		while(temp)
			value1 = temp.data
			value2 = temp1.data

			p added_value = value1 + value2 + carry
			carry = 0
			sum << 
				if added_value >= 10 and temp.next != nil
					value_array = added_value.to_s.split('')
					carry = value_array.first.to_i
					value_array.last
				else
					added_value.to_s
				end

			temp = temp.next
			temp1 = temp1.next
		end

		p sum.reverse.join('').to_i
	end

	def rotate(k)
		index = 0
		temp = head = @head
		while(index != k)
			temp = temp.next
			index += 1
		end

		first_node = temp
		while temp
			if temp.next == nil
				temp.next = head
			elsif temp.next == first_node
				temp.next = nil
			end

			temp = temp.next
		end

		self.head = first_node
		self.printList

		self
	end

	def self.create_dummy_linked_list
		l = new
		l.push 76
		l.push 11
		l.push 9
		l.push 15
		l.push 4
		l.push 90
		l.push 5
		l.push 56
		l.push 99
		l.push 19
		l.push 39
		l.push 26
		
		l
	end

	private

		def moveNode(node)
			self.push node.data
			node = node.next	
		end


end

# l = LinkedList.new
# l.push 76
# l.push 11
# l.push 9
# l.push 15
# l.push 4
# l.push 90
# l.push 5
