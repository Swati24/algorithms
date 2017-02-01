class Prog

  attr_accessor :total, :array

  def initialize(total, array)
    @total = total
    @array = array
  end


  def process
    i = 0
    p change_matrix = Array.new(array.length + 1){Array.new(total + 1)}

    while( i <= array.length)
      j = 0
      while( j <= total)
        p change_matrix
        p "Value of i is #{i} and value of j is #{j}"
        if j == 0
          change_matrix[i][j] = 1
        elsif i == 0
          change_matrix[i][j] = 0
        elsif j >= array[i - 1]
          p "Required Values are [#{i-1}][#{j}] and  [#{i}][#{j - array[i - 1]}]"
          change_matrix[i][j] = change_matrix[i-1][j] + change_matrix[i][j - array[i - 1]]
        elsif j < array[i - 1]
          change_matrix[i][j] = change_matrix[i-1][j]
        end

        j += 1
      end

      p change_matrix
      i += 1
    end

    change_matrix
  end

  def self.run
    i = Prog.new(4, [1, 2, 3])
    i.process
  end

end
