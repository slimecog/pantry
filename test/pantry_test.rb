require './lib/pantry'
require 'minitest/autorun'
require 'minitest/pride'
require "pry"

class PantryTest < Minitest::Test

  def test_it_exists
    p = Pantry.new

    assert_instance_of Pantry, p
  end

  def test_it_has_a_stock_hash_that_starts_empty
    p = Pantry.new

    assert Hash, p.stock
    assert_equal 0, p.stock.count
  end

  def test_it_can_check_stock
    p = Pantry.new

    assert_equal 0, p.stock_check("Cheese")
  end
end
