require './lib/recipe'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class RecipeTest < Minitest::Test
  def test_it_has_a_name
    r = Recipe.new("Cheese Pizza")
    assert_equal "Cheese Pizza", r.name
  end

  def test_it_can_add_an_ingredient
    r = Recipe.new("Cheese Pizza")
    r.add_ingredient("Flour", 500) # 500 "UNIVERSAL UNITS"
    assert_equal ["Flour"], r.ingredient_types
    r.add_ingredient("Cheese", 1500)
    assert_equal ["Flour", "Cheese"], r.ingredient_types
  end

  def test_it_tracks_amount_of_a_recipe_required
    r = Recipe.new("Cheese Pizza")
    r.add_ingredient("Flour", 500)
    assert_equal 500, r.amount_required("Flour")
  end

  def test_recipes_can_be_created
    r = Recipe.new("Cheese Pizza")

    assert_instance_of Recipe, r
  end

  def test_recipe_ingredients_start_as_empty_hash
    r = Recipe.new("Cheese Pizza")

    assert Hash, r.ingredients
    assert_empty r.ingredients
  end

  def test_recipe_can_have_ingredients_added
    r = Recipe.new("Cheese Pizza")
    r.add_ingredient("Cheese", 20)
    r.add_ingredient("Flour", 20)

    assert_equal ({"Cheese" => 20, "Flour" => 20}), r.ingredients
  end
end
