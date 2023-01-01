# The Decorator design pattern is a structural design pattern that allows you to add new behavior to an existing object
# dynamically, by wrapping the object in a decorator object that has the new behavior. The Decorator design pattern is
# often used to extend the functionality of an object without changing its implementation, and to allow multiple levels
# of decoration to be added to an object.
#
# Imagine that you are building a system for a coffee shop that serves different types of coffee drinks (e.g. espresso,
# cappuccino, and latte). The coffee shop has a set of ingredients that can be added to the coffee drinks (e.g. milk,
# sugar, and chocolate), and you want to be able to add ingredients to the coffee drinks dynamically, without changing
# the existing coffee drinks.
#
# To implement this scenario using the Decorator design pattern, you could define a Coffee class that represents a coffee
# drink, and a CoffeeDecorator class that represents an ingredient that can be added to a coffee drink. The Coffee class
# has a description and a cost method, and the CoffeeDecorator class has a description and a cost method that delegates to
# the description and cost methods of the decorated Coffee object.
#
# You could also define concrete implementations of the CoffeeDecorator class for each type of ingredient (e.g. MilkDecorator,
# SugarDecorator, and ChocolateDecorator). Each concrete implementation of the CoffeeDecorator class would have a description
# and a cost method that adds the description and cost of the ingredient to the decorated Coffee object.

# The Coffee class represents a coffee drink. It has a description and a
# cost method.
class Coffee
  def description
    'Coffee'
  end

  def cost
    2
  end
end

# The CoffeeDecorator class represents an ingredient that can be added to a
# coffee drink. It has a description and a cost method that delegates to the
# description and cost methods of the decorated Coffee object.
class CoffeeDecorator
  attr_reader :decorated_coffee

  def initialize(decorated_coffee)
    @decorated_coffee = decorated_coffee
  end

  def description
    "#{decorated_coffee.description}, #{ingredient_description}"
  end

  def cost
    decorated_coffee.cost + ingredient_cost
  end

  def ingredient_description
    raise NotImplementedError
  end

  def ingredient_cost
    raise NotImplementedError
  end
end

# The MilkDecorator class is a concrete implementation of the CoffeeDecorator
# class that represents milk as an ingredient. It has a description and a
# cost method that adds the description and cost of milk to the decorated
# Coffee object.
class MilkDecorator < CoffeeDecorator
  def ingredient_description
    'Milk'
  end

  def ingredient_cost
    0.5
  end
end

# The SugarDecorator class is a concrete implementation of the CoffeeDecorator
# class that represents sugar as an ingredient. It has a description and a
# cost method that adds the description and cost of sugar to the decorated
# Coffee object.
class SugarDecorator < CoffeeDecorator
  def ingredient_description
    'Sugar'
  end

  def ingredient_cost
    0.25
  end
end

# The ChocolateDecorator class is a concrete implementation of the
# CoffeeDecorator class that represents chocolate as an ingredient. It has a
# description and a cost method that adds the description and cost of
# chocolate to the decorated Coffee object.
class ChocolateDecorator < CoffeeDecorator
  def ingredient_description
    'Chocolate'
  end

  def ingredient_cost
    0.75
  end
end

# The client code can work with any object that implements the Coffee or
# CoffeeDecorator interface, allowing it to add ingredients to coffee drinks
# dynamically, without changing the existing coffee drinks.
coffee = Coffee.new
coffee = MilkDecorator.new(coffee)
coffee = SugarDecorator.new(coffee)
coffee = ChocolateDecorator.new(coffee)

puts coffee.description
puts coffee.cost



# In this example, the Coffee class represents a coffee drink, and the CoffeeDecorator class represents an
# ingredient that can be added to a coffee drink. The Coffee class has a description and a cost method, and
# the CoffeeDecorator class has a description and a cost method that delegates to the description and cost
# methods of the decorated Coffee object.
#
# The CoffeeDecorator class also has ingredient_description and ingredient_cost methods that are meant to be
# overridden in concrete implementations of the CoffeeDecorator class. The MilkDecorator, SugarDecorator, and
# ChocolateDecorator classes are concrete implementations of the CoffeeDecorator class that represent milk, sugar,
# and chocolate as ingredients, respectively. Each of these classes has a description and a cost method that adds the description and cost of the ingredient to the decorated Coffee object.
#
#   This allows the client code to work with any object that implements the Coffee or CoffeeDecorator interface,
# allowing it to add ingredients to coffee drinks dynamically, without changing the existing coffee drinks.
#
#   This example demonstrates how the Decorator design pattern allows you to add new behavior to an existing object
# dynamically, by wrapping the object in a decorator object that has the new behavior, and how it can be used to
# extend the functionality of an object without changing its implementation, and to allow multiple levels of decoration
# to be added to an object.

