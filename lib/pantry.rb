require "pry"
class Pantry
  attr_reader :stock,
              :shopping_list,
              :cookbook

  def initialize
    @stock = Hash.new(0)
    @shopping_list = Hash.new(0)
    @cookbook = []
  end

  def stock_check(ingredient)
    stock[ingredient]
  end

  def restock(ingredient, amount)
    stock[ingredient] += amount
  end

  def add_to_shopping_list(recipe)
    recipe.ingredients.each do |ingredient, amount|
      shopping_list[ingredient] += amount
    end
  end

  def print_shopping_list
    shopping_list.group_by { |ingredient| shopping_list[ingredient] }
  end

  def add_to_cookbook(recipe)
    cookbook.push recipe
  end

  def what_can_i_make
    required = cookbook.map { |recipe| recipe[ingredients] }
    in_stock = stock.map { |ingredient| ingredient[keys] }
    if required.include?(in_stock)
      p cookbook.ingredients
    end
  end
end



#
# def what_can_i_make
#   cookbook.map do |recipe|
#     ingredients = recipe[ingredients]
#   end
#   if stock.include?(ingredients)
#     puts recipe[name]
#   end
# end

# def what_can_i_make
#   cookbook.reduce(0) do |recipe, (ingredient, name)|
#     recipe = cookbook[ingredient]
#   end
# end
