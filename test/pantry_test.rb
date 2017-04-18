require './lib/pantry'
require './lib/recipe'
require 'minitest/autorun'
require 'minitest/pride'

class PantryTest < Minitest::Test
  def test_it_exists
    pantry = Pantry.new

    assert_instance_of Pantry, pantry
  end

  def test_it_has_stock
    pantry = Pantry.new

    assert_equal ({}), pantry.stock
  end

  def test_it_can_check_stock
    pantry = Pantry.new

    assert_equal 0, pantry.stock_check("Cheese")
  end

  def test_it_can_restock
    pantry = Pantry.new
    pantry.restock("Cheese", 10)

    assert_equal 10, pantry.stock_check("Cheese")
  end

  def test_it_can_track_multiple_restocks
    pantry = Pantry.new
    pantry.restock("Cheese", 10)
    pantry.restock("Cheese", 20)

    assert_equal 30, pantry.stock_check("Cheese")
  end

  def test_it_can_add_a_recipe_to_shopping_list
    pantry = Pantry.new
    r = Recipe.new("Cheese Pizza")
    r.add_ingredient("Flour", 500)
    r.add_ingredient("Cheese", 1500)
    pantry.add_to_shopping_list(r)

    assert_equal  ({"Cheese" => 1500, "Flour" => 500}), pantry.shopping_list
  end


  def test_it_can_add_multiple_recipes_to_shopping_list
    pantry = Pantry.new
    recipe_1 = Recipe.new("Cheese Pizza")
    recipe_1.add_ingredient("Flour", 500)
    recipe_1.add_ingredient("Cheese", 1500)
    pantry.add_to_shopping_list(recipe_1)
    recipe_2 = Recipe.new("Spaghetti")
    recipe_2.add_ingredient("Noodles", 10)
    recipe_2.add_ingredient("Sauce", 10)
    recipe_2.add_ingredient("Cheese", 5)
    pantry.add_to_shopping_list(recipe_2)

    assert_equal  ({"Cheese" => 1505,
                    "Flour" => 500,
                    "Noodles"=> 10,
                    "Sauce"=> 10,}), pantry.shopping_list
  end

  def test_it_can_print_shopping_list
    pantry = Pantry.new

    recipe_1 = Recipe.new("Cheese Pizza")
    recipe_1.add_ingredient("Flour", 500)
    recipe_1.add_ingredient("Cheese", 1500)
    pantry.add_to_shopping_list(recipe_1)

    recipe_2 = Recipe.new("Spaghetti")
    recipe_2.add_ingredient("Noodles", 10)
    recipe_2.add_ingredient("Sauce", 10)
    recipe_2.add_ingredient("Cheese", 5)

    pantry.add_to_shopping_list(recipe_2)

    assert_equal  "* Flour: 500\n* Cheese: 1505\n* Noodles: 10\n* Sauce: 10\n", pantry.print_shopping_list
  end

  def test_it_can_add_a_recipe_to_cookbook
    pantry = Pantry.new

    r1 = Recipe.new("Cheese Pizza")
    r1.add_ingredient("Cheese", 20)
    r1.add_ingredient("Flour", 20)

    pantry.add_to_cookbook(r1)

    assert_equal [r1], pantry.cookbook
  end

  def test_it_can_add_multiple_recipes_to_cookbook
    pantry = Pantry.new

    r1 = Recipe.new("Cheese Pizza")
    r1.add_ingredient("Cheese", 20)
    r1.add_ingredient("Flour", 20)
    pantry.add_to_cookbook(r1)

    r2 = Recipe.new("Pickles")
    r2.add_ingredient("Brine", 10)
    r2.add_ingredient("Cucumbers", 30)
    pantry.add_to_cookbook(r2)


    assert_equal [r1,r2], pantry.cookbook
  end

  def test_it_knows_what_i_can_make
    pantry = Pantry.new

    r1 = Recipe.new("Cheese Pizza")
    r1.add_ingredient("Cheese", 20)
    r1.add_ingredient("Flour", 20)

    r2 = Recipe.new("Pickles")
    r2.add_ingredient("Brine", 10)
    r2.add_ingredient("Cucumbers", 30)

    r3 = Recipe.new("Peanuts")
    r3.add_ingredient("Raw nuts", 10)
    r3.add_ingredient("Salt", 10)

    pantry.add_to_cookbook(r1)
    pantry.add_to_cookbook(r2)
    pantry.add_to_cookbook(r3)

    pantry.restock("Cheese", 10)
    pantry.restock("Flour", 20)
    pantry.restock("Brine", 40)
    pantry.restock("Cucumbers", 40)
    pantry.restock("Raw nuts", 20)
    pantry.restock("Salt", 20)

    assert_equal ["Pickles", "Peanuts"], pantry.what_can_i_make
  end






end
