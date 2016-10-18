class Prog

  attr_accessor :n, :k

  def initialize(n, k)
    @n = n
    @k = k
  end


  def process
    i = 0
    matrix = Array.new(k + 1){Array.new(n + 1)}

    while( i <= k)
      j = 0
      while( j <= n)
        p matrix
        p "Value of i is #{i} and value of j is #{j}"

        if j >= i
          if j == 0 or i == 0 or i == j
            matrix[i][j] = 1
          else
            matrix[i][j] = matrix[i - 1][j - 1] + matrix[i][j - 1]
          end
        end

        j += 1
      end

      matrix
      i += 1
    end

    matrix
  end

  def self.run
    i = Prog.new(8,2)
    i.process
  end

end
