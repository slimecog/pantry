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
end
