# The Adapter design pattern is a structural design pattern that allows you to adapt one interface to another,
# allowing classes to work together that couldn't otherwise because of incompatible interfaces.
# The Adapter design pattern is often used in conjunction with the Bridge design pattern, which decouples an
# abstraction from its implementation.
#
# Here's a real-world example of how the Adapter design pattern could be used, along with an explanation of how
# it could be implemented in Ruby code:
#
# Imagine that you are building a system for a coffee shop that serves different types of coffee (e.g. espresso,
# cappuccino, and latte). The coffee shop has a set of machines for brewing and serving coffee, and you want to
# be able to add support for new types of coffee without changing the existing machines.
#
# To implement this scenario using the Adapter design pattern, you could define an EspressoMachine class that represents
# a machine for brewing espresso, and a CoffeeMachine class that represents a machine for brewing other types of coffee.
# The EspressoMachine class has a brew method that takes an EspressoCoffee object and returns a brewed espresso,
# and the CoffeeMachine class has a brew method that takes a Coffee object and returns a brewed coffee.
#
# However, the EspressoMachine and CoffeeMachine classes have incompatible interfaces, so you can't use them together.
# To solve this problem, you could define an EspressoCoffeeMachineAdapter class that adapts the EspressoMachine class
# to the CoffeeMachine interface. The EspressoCoffeeMachineAdapter class would have a reference to an EspressoMachine object,
# and its brew method would take a Coffee object, convert it to an EspressoCoffee object, and delegate to the brew method on
# the EspressoMachine object.

# The EspressoMachine class represents a machine for brewing espresso. It has
# a brew method that takes an EspressoCoffee object and returns a brewed
# espresso.
class EspressoMachine
  def brew(espresso_coffee)
    puts "Brewing espresso with #{espresso_coffee.beans} beans"
  end
end

# The CoffeeMachine class represents a machine for brewing other types of
# coffee. It has a brew method that takes a Coffee object and returns a
# brewed coffee.
class CoffeeMachine
  def brew(coffee)
    puts "Brewing coffee with #{coffee.beans} beans"
  end
end

# The EspressoCoffeeMachineAdapter class adapts the EspressoMachine class to
# the CoffeeMachine interface. It has a reference to an EspressoMachine
# object and its brew method takes a Coffee object, converts it to an
# EspressoCoffee object, and delegates to the brew method on the
# EspressoMachine object.
class EspressoCoffeeMachineAdapter
  def initialize(espresso_machine)
    @espresso_machine = espresso_machine
  end

  def brew(coffee)
    espresso_coffee = EspressoCoffee.new(coffee.beans)
    @espresso_machine.brew(espresso_coffee)
  end
end

# The client code can work with the CoffeeMachine and any adapter that
# implements the CoffeeMachine interface, allowing it to brew different
# types of coffee without having to know the details of how each type of
# coffee is brewed.
espresso_machine = EspressoMachine.new
coffee_machine = CoffeeMachine.new
espresso_coffee_machine_adapter = EspressoCoffeeMachineAdapter.new(espresso_machine)

coffee_machine.brew(Coffee.new('Arabica'))
espresso_coffee_machine_adapter.brew(Coffee.new('Arabica'))
# In this example, the EspressoMachine class represents a machine for brewing espresso, and the CoffeeMachine class represents a
# machine for brewing other types of coffee. The EspressoMachine class has a brew method that takes an EspressoCoffee object and
# returns a brewed espresso, and the CoffeeMachine class has a brew method that takes a Coffee object and returns a brewed coffee.
#
#   However, the EspressoMachine and CoffeeMachine classes have incompatible interfaces, so you can't use them together. To solve
# this problem, you define an EspressoCoffeeMachineAdapter class that adapts the EspressoMachine class to the CoffeeMachine
# interface. The EspressoCoffeeMachineAdapter class has a reference to an EspressoMachine object and its brew method takes a
# Coffee object, converts it to an EspressoCoffee object, and delegates to the brew method on the EspressoMachine object.
#
# This allows the client code to work with the CoffeeMachine and any adapter that implements the CoffeeMachine interface, allowing
# it to brew different types of coffee without having to know the details of how each type of coffee is brewed.
#
# This example demonstrates how the Adapter design pattern can allow classes to work together that couldn't otherwise because
# of incompatible interfaces, and how it can be used in conjunction with the Bridge design pattern, which decouples an abstraction
# from its implementation.