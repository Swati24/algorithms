class Lps

  attr_accessor :array, :input, :start, :lend, :center

  def initialize(input)
    @input = input
    @array = Array.new(input.length)
    @start = @lend = 0
    @center = -1
  end

  def process
    i = 0

    while( i < input.length)
      p "======================"
      p i
      p start
      p lend
      p @array

      while(start > 0 and lend < input.length and input[start - 1] == input[lend + 1])
        @start -= 1
        @lend += 1
      end

      p lend
      p start

      @array[i] = lend - start + 1
      p @array

      @center = lend + (i % 2 == 0 ? 1 : 0)

      j = i + 1

      while( j <= lend )
        @array[j] = [@array[2*i - j], 2 * (lend - j) + 1].min

        j += 1

        if(j + array[i - (j - i)]/2 == lend)
          @center = j
          break
        end
      end

      p center
      p i


      lend = i + @array[i]/2
      start = i - @array[i]/2

      i = center
    end

  end

end
