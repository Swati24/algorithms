class Prog

  attr_accessor :array, :lis

  def initialize(array)
    @array = array
    @lis = [[array[0]]]
  end

  def process
    i = 1

    while(i < array.length)

      j = 0
      while(j <= i)
        p lis
        @lis[i]||= []
        if array[j] <= array[i]
          @lis[i] << array[j]
        end
        j += 1
      end

      i += 1
    end

    lis
  end

  def self.run
    p = Prog.new([ 1, 11, 2, 10, 4, 5, 2, 1])
    p.process
  end

end
