class Prog

  attr_accessor :matrix

  def initialize(matrix)
    @matrix = matrix

  end


  def process
    m = matrix.length
    n = matrix.first.length
    k = 0
    l = 0

    while(m > k and n > l)
      i = k
      j = l

      #p "FIrst Order"
      while(j < n - 1)
        p matrix[i][j]
        j += 1
      end



      #p "Second Order"
      while(i < m - 1)
        p matrix[i][j]
        i += 1
      end

      n -= 1

      #p "Third Order"
      while(j > l)
        p matrix[i][j]
        j -= 1
      end

      m -= 1

      #p "Fourth Order"
      while(i > k)
        p matrix[i][j]
        i -= 1
      end

      k += 1
      l += 1
    end


  end

  def self.run
    i = Prog.new([[1, 2, 3], [6, 7, 8], [11, 12, 13]])
    i.process
  end

end
