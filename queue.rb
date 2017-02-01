class Queue

  attr_accessor :front, :rear, :capacity, :array, :size

  def initialize
    @front = 0
    @size = 0
    @rear = 0
    #@capacity = capacity
    @array = []
  end

  def enqueue(element)
    @array[rear] = element
    @rear += 1
    @size += 1
  end

  def dequeue
    return nil if is_empty
    element = array[front]
    @front += 1
    @size -= 1

    element
  end

  def is_full
    #front >= rear
  end

  def is_empty
    size == 0
  end

  def get_front
    array[front]
  end

  def get_rear
    array[rear]
  end

  def max_in_subarray(arr, k)
    n = array.length

    i = 0

    while(i < k)

      i += 1
    end


  end

end
