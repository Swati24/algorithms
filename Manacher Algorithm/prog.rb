class Prog

  attr_accessor :input, :new_input, :temp


  def initialize(input)
    @input = input
    @new_input = []
    @temp = []
  end

  def process
    set_new_input
    p new_input

    start = 0
    lend = 0

    i = 0
    while( i < new_input.length)
      p "======="
      p new_input[i]
      while( start >= 0 and lend < new_input.length and new_input[start - 1] == new_input[lend + 1])
        start -= 1
        lend += 1
      end

      p "AFter matching start is #{start}"
      p "AFter matching lend is #{lend}"

      @temp[i] = lend - start + 1
      new_center = lend + (i % 2 == 0 ? 1 : 0)

      p "After matching new center is #{new_center}"

      j = i + 1

      while(j <= lend)
        p "Inside loop"

        @temp[j] = [@temp[i - (j - i)], 2 * (lend - j) + 1].min

        p "Compuyting for index #{j} because we have a range now and the value is #{@temp[j]}"

        p "new center condition is #{j + @temp[i - (j - i)]/2 == lend}"
        if (j + @temp[i - (j - i)]/2 == lend)
          new_center = j
          p "Setting new_center => #{new_center}"
          break
        end

        j += 1
      end

      i = new_center
      if @temp[i]
        lend = i + @temp[i]/2
        start = i - @temp[i]/2
      else
        lend = i
        start = i
      end

      p "FInal values"
      p "new_center and i are same and they are #{i}"
      p "start => #{start}"
      p "lend => #{lend}"
      p @temp
    end

    get_max_length
  end

  def get_max_length
    max = -1

    i = 0
    while(i < @temp.length)
      val = @temp[i]/2

      max = max > val ? max : val

      i += 1
    end

    max
  end

  def set_new_input
    i = 0
    index = 0

    while(i < (2 * input.length + 1))
      if i % 2 != 0
        @new_input[i] = input[index]
        index += 1
      else
        @new_input[i] = '$'
      end

      i += 1
    end
  end

  def self.run
    p = Prog.new('abaxabaxabb')
    p.process
  end

end


