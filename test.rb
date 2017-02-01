class Test

  def get_dollars(amount)
    if amount == 0
      return
    end

    first_part = (amount.to_f/2).round
    sec_part = (amount.to_f/3).round
    third_part = (amount.to_f/4).round

    get_dollars(first_part) + get_dollars(sec_part) + get_dollars(third_part)
  end


  def run
    p get_dollars(amount)
  end


end
