require_relative 'base_sort.rb'

class SelectionSort < BaseSort
  def process
    i = 0

    while i < length - 1 do
      j = i + 1
      min_index = i

      while( j <= length - 1)
        if array[min_index] > array[j]
          min_index = j
        end

        j += 1
      end

      swap(i, min_index)
      p array
      i += 1
    end

    array
  end

end
