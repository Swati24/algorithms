require_relative 'base_sort.rb'

class InsertionSort < BaseSort
  def process
    i = 1

    while( i <= length - 1) do
      j = i

      while(j > 0)
        if array[j] < array[j - 1]
          swap(j, j - 1)
        end

        j -= 1
      end

      i += 1
    end

    array
  end

  def self.run
    i = InsertionSort.new([12, 11, 13, 5, 6])
    i.process
  end

end
