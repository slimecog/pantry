require './lib/pantry'
require 'minitest/autorun'
require 'minitest/pride'
require "pry"

class PantryTest < Minitest::Test

  def test_it_exists
    pantry = Pantry.new

    assert_instance_of Pantry, pantry
  end

  def test_it_has_a_stock_hash_that_starts_empty
    pantry = Pantry.new

    assert Hash, pantry.stock
    assert_equal 0, pantry.stock.count
  end

  def test_it_can_check_stock
    pantry = Pantry.new

    assert_equal 0, pantry.stock_check("Cheese")
  end

  def test_it_can_restock_ingredients
    pantry = Pantry.new

    assert_equal 10, pantry.restock("Cheese", 10)
  end

  def test_stock_can_be_checked_to_reflect_restock
    pantry = Pantry.new
    pantry.restock("Cheese", 10)
    pantry.restock("Cheese", 20)

    assert_equal 30, pantry.stock_check("Cheese")
  end

  def test_recipes_can_be_created
    pantry = Pantry.new
    r = Recipe.new("Cheese Pizza")

    assert_instance_of Recipe, r
  end

  def test_recipe_ingredients_start_as_empty_hash
    pantry = Pantry.new
    r = Recipe.new("Cheese Pizza")

    assert Hash, r.ingredients
    assert_empty r.ingredients
  end

  def test_recipe_can_have_ingredients_added
    pantry = Pantry.new
    r = Recipe.new("Cheese Pizza")
    r.add_ingredient("Cheese", 20)
    r.add_ingredient("Flour", 20)

    assert_equal ({"Cheese" => 20, "Flour" => 20}), r.ingredients
  end

  def test_pantry_can_add_to_shopping_list
    pantry = Pantry.new
    r = Recipe.new("Cheese Pizza")

    

end
