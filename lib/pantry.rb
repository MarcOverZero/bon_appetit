require './lib/recipe'
require 'pry'

class Pantry

  attr_reader :stock, :shopping_list, :cookbook, :menu
  def initialize
    @stock = Hash.new(0)
    @shopping_list = Hash.new(0)
    @cookbook = []
    @menu = []
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

  def how_many_can_i_make
    makeable = {}
    menu.map do |recipe|
      recipe.ingredients.each do |ingredient, quantity|
        stock_quantity = stock[ingredient]
        number_makeable = 0
        while stock_quantity > 0
          stock[ingredient] -= quantity
          number_makeable += 1
        end
        makeable[

  end
end
