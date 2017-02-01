class CustomString

  attr_accessor :string

  def initialize(string)
    @string = string
  end

  def decode
    result = ""
    comb = []
    freq = 0

    p string

    string.split('').each do |char|
      p char
      if (48..57).to_a.include?(char.ord)
        if freq == 0
          p freq = char.to_i
        else
          p freq = freq * 10 + char.to_i
        end
      else
        if freq > 0
          freq.times do |index|
            p result += comb.join
          end
          comb = []
          freq = 0
        end

        comb << char
      end
    end

    if freq > 0
      freq.times do |index|
        p result += comb.join
      end
    end

    result
  end

end
