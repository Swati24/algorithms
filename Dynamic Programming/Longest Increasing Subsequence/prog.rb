class Prog

  attr_accessor :array

  def initialize(array)
    @array = array
  end


  def process
    lis = []
    lis[0] = [array[0]]

    i = 1
    while(i < array.length)
      j = 0
      while(j < i)
        lis[i] ||= []
        if(array[j] < array[i] and lis[i].length < lis[j].length + 1)
          lis[i] = lis[j].dup
        end

        j+= 1
      end

      lis[i].push(array[i])
      p lis
      i += 1
    end
  end

  def self.run
    i = Prog.new([ 15, 27, 14, 38, 26, 55, 46, 65, 85])
    i.process
  end

end
