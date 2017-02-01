class Prog

  attr_accessor :array, :lis, :lds

  def initialize(array)
    @array = array
    @lis = [1]
    @lds = [1]
  end

  def process
    i = 1
    while(i < array.length)
      j = 0
      while(j < i)
        p lis
        @lis[i] ||= 1
        if array[j] < array[i] and lis[j] >= lis[i]
          @lis[i] = lis[j] + 1
        end

        @lds[i] ||= 1
        if array[j] > array[i] and lds[j] >= lds[i]
          @lds[i] = lds[j] + 1
        end


        j += 1
      end

      i += 1
    end

    p "LIS"
    p lis
    p "LDS"
    p lds

    k = 0
    max = -10
    while(k < array.length)
      val = lis[k] + lds[k] - 1
      max = val if max < val
      k += 1
    end

    p max
  end

  def self.run
    p = Prog.new([ 80, 60, 30, 40, 20, 10])
    p.process
  end

end
