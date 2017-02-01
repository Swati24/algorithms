class Prog

  attr_accessor :matrix, :row, :col

  def initialize(matrix)
    @matrix = matrix
    @row = [0, 0, 0]
    @col = [0, 0, 0, 0]
  end


  def process
    i = 0
    m = matrix.length
    n = matrix.first.length

    while(i < m)
      j = 0
      while(j < n)

        if matrix[i][j] == 1
          @row[i] = 1
          @col[j] = 1
        end

        j += 1
      end
      i += 1
    end

    p row
    p col

    i = 0
    while(i < m)
      j = 0
      while(j < n)
        if row[i] == 1 or col[j] == 1
          @matrix[i][j] = 1
        end

        j += 1
      end
      i += 1
    end

    @matrix
  end

  def self.run
    i = Prog.new([[1, 0, 0, 1], [0, 0, 1, 0], [0, 0, 0, 0]])
    i.process
  end

end
