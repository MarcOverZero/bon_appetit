require './lib/recipe'
require 'pry'

class Pantry

  attr_reader :stock, :shopping_list, :cookbook
  def initialize
    @stock = Hash.new(0)
    @shopping_list = Hash.new(0)
    @cookbook = []
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
      shopping_list_string += "* #{ingredient}: #{quantity}\n"
    end
    shopping_list_string
  end

  def add_to_cookbook(recipe)
    cookbook << recipe
  end

  def what_can_i_make
    menu = []
    cookbook.each do |recipe|
      can_make = true
      recipe.ingredients.each do |ingredient, quantity|
        if (stock[ingredient] -= quantity) < 0
          can_make = false
        end
      end
      if can_make == true
        menu << recipe.name
      end
    end
    menu
  end
end
