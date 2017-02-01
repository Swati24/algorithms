class Prog

  attr_accessor :string

  def initialize(string)
    @string = string
  end


  def process
    matrix = Array.new(string.length){ Array.new(string.length) }

    i = 0

    while(i < string.length)
      j = 0

      while( i + j < string.length)

        p "value of i is #{i} and of j is #{j}"
        if i == 0
          matrix[i][j] = 0
        elsif string[j] == string[i + j]
          p "values are same"

          matrix[i][j] = i > 1 ? 0 + matrix[i-2][j+1] : 0
        else
          p "values are not same"
          matrix[i][j] = 2 + matrix[i-1][j] + matrix[i - 1][ j + 1]
        end

        p matrix

        j += 1
      end

      i += 1
    end


    p "Finally======="
    p matrix
    matrix[string.length - 1][0]
  end

  def self.run
    i = Prog.new("ababbbabbababa")
    i.process
  end

end
