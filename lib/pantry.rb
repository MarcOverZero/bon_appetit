class Pantry

  attr_reader :stock
  def initialize
    @stock = Hash.new(0)
  end

  def stock_check(item)
    stock[item]    #### downcase item?
  end

  def restock(item, quantity)
    stock[item] = stock[item] += quantity
  end
end
