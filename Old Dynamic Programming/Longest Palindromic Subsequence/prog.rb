class Prog

  attr_accessor :string

  def initialize(string)
    @string = string
  end


  def process
    matrix = Array.new(string.length){Array.new( string.length )}

    i = 0
    while(i <= string.length)

      j = 0
      while( j <= string.length - 1)
        if i + j < string.length
          if i == 0
            matrix[i][j] = 1
          elsif string[j] == string[j + i]
            matrix[i][j] = 2 + (matrix[i - 2][j+1] || 0)
          elsif string[j] != string[j + i]
            matrix[i][j] = [matrix[i -1][j], matrix[i -1][j+1]].max
          end
        end

        j += 1
      end

      i += 1
    end

    matrix[string.length - 1][0]
  end

  def self.run
    i = Prog.new("AABCDEBAZ")
    i.process
  end

end
