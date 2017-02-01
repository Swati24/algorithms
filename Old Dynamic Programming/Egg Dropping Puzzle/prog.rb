class Prog

  attr_accessor :eggs, :floors

  def initialize(floors, eggs)
    @eggs = eggs
    @floors = floors
  end


  def process
    i = 0
    matrix = Array.new(eggs + 1){Array.new(floors + 1)}

    while( i <= eggs)
      j = 0
      while( j <= floors)
        p matrix
        p "Value of i is #{i} and value of j is #{j}"

        if i == 1
          matrix[i][j] = j
        elsif i == 0 or j == 0
          matrix[i][j] = 0
        elsif j < i
          matrix[i][j] = matrix[i - 1][j]
        else
          array = []
          (1..j).each do |floor|
            p "Required values => [#{i - 1}][#{floor - 1}] and [#{i}][#{j - floor}] gives us #{[ matrix[i - 1][floor - 1], matrix[i][j - floor]].max}"
            array << (1 + [ matrix[i - 1][floor - 1], matrix[i][j - floor]].max)
          end
          p array
          matrix[i][j]  = array.min
        end

        j += 1
      end

      matrix
      i += 1
    end

    matrix[eggs][floors]
  end

  def self.run
    i = Prog.new(10 , 2)
    i.process
  end

end
