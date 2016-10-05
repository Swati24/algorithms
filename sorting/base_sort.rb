class BaseSort
  attr_accessor :array, :length

  def initialize(array)
    @array = array
    @length = get_length
  end

  def get_length
    n = 0
    array.each do |element|
      n += 1
    end

    n
  end

  def swap(index_1, index_2)
    temp = array[index_1]
    array[index_1] = array[index_2]
    array[index_2] = temp
  end

end
