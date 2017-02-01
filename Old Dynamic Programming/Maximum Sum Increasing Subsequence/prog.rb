class Prog

  attr_accessor :array

  def initialize(array)
    @array = array
  end


  def process
    lis = []
    lis[0] = array[0]

    i = 1
    while(i < array.length)
      j = 0
      p "==================="
      p "Value of i is #{i}"
      msis = []

      while(j <= i)
        p "Value of j is #{j}"
        if(array[j] <= array[i] and array[j] > msis.last)
          msis << array[j]
          #lis[i] = lis[i] + (array[i] + array[j])
        end

        j+= 1
      end

      p lis[i] = msis
      i += 1
    end

    p lis
    #lis.max
  end

  def self.run
    i = Prog.new([4, 6, 1, 3, 8, 4, 6])
    i.process
  end

end
