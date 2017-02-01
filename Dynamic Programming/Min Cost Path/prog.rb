class Prog

  attr_accessor :input, :matrix

  def initialize(input)
    @input = input
    @matrix = Array.new(input.length){ Array.new(input.first.length) }
  end


  def process
    i = 0

    while(i < input.length)
      j = 0

      while( j < input.first.length)
        p matrix

        if i == 0 and j == 0
          @matrix[i][j] = input[i][j]
        elsif i == 0
          @matrix[i][j] = input[i][j] + matrix[i][j - 1]
        elsif j == 0
          @matrix[i][j] = input[i][j] + matrix[i - 1][j]
        else
          @matrix[i][j] = input[i][j] + [matrix[i - 1][j - 1], matrix[i][j - 1], matrix[i - 1][j]].min
        end

        j += 1
      end

      i += 1
    end

    matrix
  end

  def self.run
    i = Prog.new([[1, 2, 3], [4, 8, 2], [1, 5, 3]])
    i.process
  end

end

