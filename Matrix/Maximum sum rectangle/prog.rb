class Prog

  attr_accessor :matrix, :row, :col, :temp, :max_sum, :start, :finish

  def initialize(matrix)
    @matrix = matrix
    @row = @matrix.length
    @col = @matrix.first.length
    @max_sum = -100
    @start = -1
    @finish = -1
    @temp = []
  end

  def process
    left = 0

    while(left < col)
      set_temp_array

      right = 0

      while(right < col)

        i = 0

        while(i < row)
          temp[i] += matrix[i][right]

          sum = kadane

          if sum > max_sum
            @max_sum = sum
            @final_left = left
            @final_right = right
            @final_top = start
            @final_bottom = finish
          end

          p temp
          i += 1
        end

        right += 1
      end

      left += 1
    end

  end

  def kadane
    sum = 0
    max = -100

    local_start = 0

    i = 0
    while(i < row)

      sum += temp[i]

      if sum < 0
        sum = 0
        local_start = i + 1
      elsif max < sum
        max = sum
        @start = local_start
        @finish = i
      end

      i += 1
    end

    if finish != -1
      return max
    end

    max = temp[0]
    @start = @finish = 0

    i = 0
    while(i < row)
      if temp[i] > max
        max = temp[i]
        @start = @finish = i
      end

      i += 1
    end

    return max
  end


  def set_temp_array
    i = 0

    while(i < row)
      @temp[i] = 0
      i += 1
    end

  end

  def self.run
    i = Prog.new([[1, 2, -1, -4, -20], [-8, -3, 4, 2, 1], [3, 8, 10, 1, 3], [-4, -1, 1, 7, -6]])
    i.process
  end

end
