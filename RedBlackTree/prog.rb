class Node

  attr_accessor :data, :left, :right, :color

  def initialize(data)
    @data = data
    @left = @right = nil
    @color = false
  end


  def is_red?
    color == true
  end

  def is_black?
    !is_red?
  end

end

class Prog

end
