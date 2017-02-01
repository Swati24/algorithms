class Prog

  attr_accessor :string1, :string2

  def initialize(string1, string2)
    @string1 = string1
    @string2 = string2
  end


  def process
    i = 0

    lcs = Array.new(string1.length + 1){Array.new(string2.length + 1)}

    l1 = string1.length
    l2 = string2.length

    while(i <= l1)
      j = 0
      while(j <= l2)
        if i == 0 or j == 0
          lcs[i][j] = 0
        else
          p "Printing string 1 element > #{string1[i - 1]}"
          p "Printing string 2 element > #{string2[j - 1]}"
          if string1[i - 1] == string2[j - 1]
            p "Swati"
            lcs[i][j] = 1 + lcs[i - 1][j - 1]
            p lcs
          else
            lcs[i][j] = [lcs[i][j - 1], lcs[i - 1][j]].max
          end
        end
        j += 1
      end

      p lcs
      i += 1
    end

    p lcs
    lcs[l1][l2]
  end

  def self.run
    i = Prog.new("ABCDGH", "AEDFHR  ")
    i.process
  end

end
