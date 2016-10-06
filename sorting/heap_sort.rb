require_relative 'base_sort.rb'

class HeapSort < BaseSort

  def process

    index_1 = (length/2) - 1

    while(index_1 >= 0)
      heapify(index_1)
      index_1 -= 1
    end

    index = length - 1

    while(index > 0)
      swap(0, index)
      heapify(0, index)
      index -= 1
    end

    array
  end

  def heapify(index, n = length)
    lindex = 2 * index + 1
    rindex = 2 * index + 2

    largest = index

    if lindex < n and array[largest] < array[lindex]
      largest = lindex
    end

    if rindex < n and array[largest] < array[rindex]
      largest = rindex
    end

    if largest != index
      swap(index, largest)
      heapify(largest, n)
    end
  end

  def largest_child_index(lchild, rchild, index)
    return 2 * index + 1 if rchild.nil?
    return 2 * index + 2 if lchild.nil?
    lchild > rchild ? 2 * index + 1 : 2 * index + 2
  end

  def self.run
    h = HeapSort.new([38, 27, 43, 3, 9, 82, 10])
    h.process
  end

end
