# The Abstract Factory design pattern is a creational design pattern that provides an interface for
# creating families of related or dependent objects without specifying their concrete classes. The Abstract
# Factory design pattern is often used to implement the Factory Method design pattern, which allows you to
# create objects without specifying their concrete classes.
#
# Imagine that you are building a system for a car factory that produces different models of cars
# (e.g. hatchbacks, sedans, and SUVs). The car factory has a set of machines for assembling the different parts of
# the cars, and you want to be able to add support for new models of cars without changing the existing machines.
#
# To implement this scenario using the Abstract Factory design pattern, you could define an Assembler interface that
# declares an assemble method, and concrete implementations of the Assembler interface for each type of car
# (e.g. HatchbackAssembler, SedanAssembler, and SUVAssembler). You could also define an AbstractCarFactory class that
# has an assemble method that takes an Assembler object and returns a car.
#
# The AbstractCarFactory class would have a reference to an Assembler object, and its assemble method would delegate
# to the assemble method on the Assembler object. This allows you to add support for new models of cars by creating a
# new concrete implementation of the Assembler interface, without changing the existing machines in the AbstractCarFactory class.
# The Assembler interface declares the assemble method.
class Assembler
  def assemble
    raise NotImplementedError, "You must implement #{self.class}##{__method__}"
  end
end

# Concrete implementations of the Assembler interface assemble a specific
# type of car.
class HatchbackAssembler < Assembler
  def assemble
    puts 'Assembling hatchback'
  end
end

class SedanAssembler < Assembler
  def assemble
    puts 'Assembling sedan'
  end
end

class SUVAssembler < Assembler
  def assemble
    puts 'Assembling SUV'
  end
end

# The AbstractCarFactory class has an assemble method that takes an
# Assembler object and returns a car. It has a reference to an Assembler
# object and its assemble method delegates to the assemble method on the
# Assembler object.
class AbstractCarFactory
  def initialize(assembler)
    @assembler = assembler
  end

  def assemble
    @assembler.assemble
  end
end

# The client code can work with any concrete implementation of the
# AbstractCarFactory class and any concrete implementation of the Assembler
# interface, allowing it to assemble different types of cars without having
# to know the details of how each type of car is assembled.
hatchback_assembler = HatchbackAssembler.new
hatchback_factory = AbstractCarFactory.new(hatchback_assembler)
hatchback_factory.assemble

sedan_assembler = SedanAssembler.new
sedan_factory = AbstractCarFactory.new(sedan_assembler)
sedan_factory.assemble

suv_assembler = SUVAssembler.new
suv_factory = AbstractCarFactory.new(suv_assembler)
suv_factory.assemble

# In this example, the Assembler interface declares the assemble method, and the HatchbackAssembler, SedanAssembler, and
# SUVAssembler classes are concrete implementations of the Assembler interface that assemble a specific type of car.
#
#   The AbstractCarFactory class has an assemble method that takes an Assembler object and returns a car. It has a
# reference to an Assembler object and its assemble method delegates to the assemble method on the Assembler object.
# This allows you to add support for new models of cars by creating a new concrete implementation of the Assembler interface,
# without changing the existing machines in the AbstractCarFactory class.
#
#     This allows the client code to work with any concrete implementation of the AbstractCarFactory class and any
# concrete implementation of the Assembler interface, allowing it to assemble different types of cars without having
# to know the details of how each type of car is assembled.
#
#       This example demonstrates how the Abstract Factory design pattern can provide an interface for creating families of
# related or dependent objects without specifying their concrete classes, and how it can be used to implement the Factory
# Method design pattern, which allows you to create objects without specifying their concrete classes.
