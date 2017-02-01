class Prog

  attr_accessor :matrix, :m, :n

  def initialize(matrix, m, n)
    @n = n
    @m = m
    @matrix = matrix
    @k = k
  end


  def process
    i = 0
    matrix_1 = Array.new(matrix.length){Array.new( matrix.first.length)}

    while( i <= m)
      j = 0
      while( j <= n)
        p matrix_1
        p "Value of i is #{i} and value of j is #{j}"

        if i == 0 and j == 0
          matrix_1[i][j] = matrix[i][j]
        elsif i == 0
          matrix_1[i][j] = matrix[i][j] + matrix_1[i][j - 1]
        elsif j == 0
          matrix_1[i][j] = matrix[i][j] + matrix_1[i - 1][j]
        else
          matrix_1[i][j] = [matrix_1[i - 1][j - 1], matrix_1[i][j - 1], matrix_1[i - 1][j]].min + matrix[i][j]
        end

        j += 1
      end

      matrix_1
      i += 1
    end

    matrix_1[m][n]
  end

  def self.run
    i = Prog.new([[ 1, 2, 3], [4, 8, 2], [1, 5, 3]], 2, 2)
    i.process
  end

end
