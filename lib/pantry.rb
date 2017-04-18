require './lib/recipe'

class Pantry

  attr_reader :stock, :shopping_list
  def initialize
    @stock = Hash.new(0)
    @shopping_list = Hash.new(0)
  end

  def stock_check(item)
    stock[item]    #### downcase item?
  end

  def restock(item, quantity)
    stock[item] = stock[item] += quantity
  end

  def add_to_shopping_list(recipe)
    recipe.ingredients.each do |ingredient|
      shopping_list[ingredient] = shopping_list[ingredient] += r[ingredient]
    end

  end
end
