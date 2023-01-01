# The Builder design pattern is a creational design pattern that allows you to create complex objects step by step.
# It separates the construction of an object from its representation, so that the same construction process can create different representations.

# This pattern is used by fast food restaurants to construct children's
# meals. Children's meals typically consist of a main item, a side item, a
# drink, and a toy (e.g., a hamburger, fries, Coke, and toy dinosaur). Note
# that there can be variation in the content of the children's meal, but the
# construction process is the same.
#
# Whether a customer orders a hamburger, cheeseburger, or chicken,
# the process is the same. The employee at the counter directs the crew to
# assemble a main item, side item, and toy. These items are then placed in
# a bag. The drink is placed in a cup and remains outside of the bag. This
# same process is used at competing restaurants.

# Customer = Client
# Cashier = Director
# Restaurant Crew = Builder
# Product = Order kid's meal
# Get meal = start the step

# The Product class represents the complex object that is being built.
class Product
  attr_accessor :parts

  def initialize
    @parts = []
  end

  def add_part(part)
    @parts << part
  end
end

# The Builder interface specifies methods for creating the different parts of
# the Product objects.
class Builder
  def produce_part_a
    raise NotImplementedError, 'Builder#produce_part_a() must be defined'
  end

  def produce_part_b
    raise NotImplementedError, 'Builder#produce_part_b() must be defined'
  end

  def produce_part_c
    raise NotImplementedError, 'Builder#produce_part_c() must be defined'
  end
end

# The Concrete Builders provide different implementations of the Builder
# interface.
class ConcreteBuilder1 < Builder
  def initialize
    reset
  end

  def reset
    @product = Product.new
  end

  # Concrete Builders are supposed to provide their own methods for
  # retrieving results. That's because various types of builders may
  # create entirely different products that don't follow the same
  # interface. Therefore, such methods cannot be declared in the base
  # Builder interface (at least in a statically typed programming
  # language).
  #
  # Usually, after returning the end result to the client, a builder
  # instance is expected to be ready to start producing another product.
  # That's why it's a usual practice to call the reset method at the end
  # of the `getProduct` method body. However, this behavior is not
  # mandatory, and you can make your builders wait for an explicit reset
  # call from the client code before disposing of the previous result.
  def get_product
    product = @product
    reset
    product
  end

  def produce_part_a
    @product.add_part('PartA1')
  end

  def produce_part_b
    @product.add_part('PartB1')
  end

  def produce_part_c
    @product.add_part('PartC1')
  end
end

class ConcreteBuilder2 < Builder
  def initialize
    reset
  end

  def reset
    @product = Product.new
  end

  def get_product
    product = @product
    reset
    product
  end

  def produce_part_a
    @product.add_part('PartA2')
  end

  def produce_part_b
    @product.add_part('PartB2')
  end

  def produce_part_c
    @product.add_part('PartC2')
  end
end

# The Director is only responsible for executing the building steps in a
# particular sequence. It is helpful when producing products according to a
# specific order or configuration. Strictly speaking, the Director class is
# optional, since the client can control builders directly.
class Director
  attr_accessor :builder

  def build_minimal_viable_product
    @builder.produce_part_a
  end

  def build_full_featured_product
    @builder.produce_part_a
    @builder.produce_part_b
    @builder.produce_part_c
  end
end

# The client code creates the director object, configures it with the desired
# builder object, and then runs the build process. The end result is
# retrieved from the builder object.
director = Director.new
director.builder = ConcreteBuilder1.new
puts 'Standard basic product: '
director.build_minimal_viable_product
builder = director.builder
product = builder.get_product
puts product.parts
puts "\n"

director.builder = ConcreteBuilder2.new
puts 'Standard full featured product: '
director.build_full_featured_product
builder = director.builder
product = builder.get_product
puts product.parts
puts "\n"

director.builder = ConcreteBuilder1.new
puts 'Custom product: '
director.build_minimal_viable_product
director.builder.produce_part_b
director.builder.produce_part_c
builder = director.builder
product = builder.get_product
puts product.parts

# In this example, the Product class represents the complex object that is being built, and the Builder interface specifies methods for creating the different parts of the Product objects. The ConcreteBuilder1 and ConcreteBuilder2 classes provide different implementations of the Builder interface.

# The Director class is responsible for executing the building steps in a particular sequence, and is helpful when producing products according to a specific order or configuration. The client code creates the Director object, configures it with the desired Builder object, and then runs the build process. The end result is retrieved from the Builder object.
