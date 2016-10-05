require_relative 'base_sort.rb'

class BubbleSort < BaseSort
  def process
    k = 0
    swapping_count = Time.now.to_i # max integer
    while( k <= length - 1 and swapping_count != 0)
      i = 0
      j = 1
      swapping_count = 0

      while(j <= length - 1) do
        if array[i] > array[j]
          swap(i, j)
          swapping_count += 1
        end

        i += 1
        j += 1
      end

      p array
      p swapping_count
      k += 1
    end
    array
  end

end
