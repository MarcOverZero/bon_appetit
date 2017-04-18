require './lib/recipe'
require 'pry'

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
    recipe.ingredients.each do |ingredient, quantity|
      shopping_list[ingredient] += quantity
    end
  end

  def print_shopping_list
    shopping_list_string = ""
    shopping_list.each do |ingredient, quantity|
      shopping_list_string + "* #{ingredient}: #{quantity},\n"
    end
    p shopping_list_string
  end
end
