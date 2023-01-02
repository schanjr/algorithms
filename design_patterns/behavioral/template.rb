# The Template design pattern is a behavioral design pattern that defines the skeleton of an algorithm in an operation, but lets
# subclasses override specific steps of the algorithm without changing its structure. It is often used to implement a standard interface for
# a group of related algorithms, and to allow users to select the appropriate algorithm at runtime.
#
# Here's a summary of the Template pattern:
#
# The Template pattern consists of an abstract base class that defines the structure of the algorithm, and concrete subclasses that override
# specific steps of the algorithm.
# The abstract base class defines the template_method which represents the skeleton of the algorithm, and the concrete subclasses override
# specific steps of the algorithm defined in the template_method.
#
# Here's an example of the Template design pattern in Ruby for a simple coffee brewing scenario, with a real-world example to illustrate the concept:
#
# Imagine you are building a simple coffee brewing application that can brew different types of coffee, such as espresso, cappuccino,
# and latte. The process of brewing coffee is similar for each type of coffee, but there are some specific steps that are different
# for each type of coffee.
#
# To implement this feature, you could use the Template design pattern to create an AbstractCoffeeBrewer class with a brew_coffee method
# that defines the skeleton of the coffee brewing algorithm. The AbstractCoffeeBrewer class also has abstract methods that represent specific
# steps of the coffee brewing algorithm that can be overridden by concrete subclasses.

# The AbstractCoffeeBrewer class defines the structure of the coffee brewing
# algorithm, and provides abstract methods that represent specific steps of the
# algorithm that can be overridden by concrete subclasses.
class AbstractCoffeeBrewer
  def brew_coffee
    grind_coffee_beans
    heat_water
    pour_water
    add_coffee_to_cup
    add_milk_and_sugar
  end

  def grind_coffee_beans
    raise NotImplementedError
  end

  def heat_water
    raise NotImplementedError
  end

  def pour_water
    raise NotImplementedError
  end

  def add_coffee_to_cup
    raise NotImplementedError
  end

  def add_milk_and_sugar
    raise NotImplementedError
  end
end

# The EspressoCoffeeBrewer class represents the espresso coffee brewer, and
# overrides specific steps of the coffee brewing algorithm defined in the
# AbstractCoffeeBrewer class.
class EspressoCoffeeBrewer < AbstractCoffeeBrewer
  def grind_coffee_beans
    puts "Grinding espresso beans"
  end

  def heat_water
    puts "Heating water for espresso"
  end

  def pour_water
    puts "Pouring hot water over espresso beans"
  end

  def add_coffee_to_cup
    puts "Adding espresso to cup"
  end

  def add_milk_and_sugar
    puts "No milk or sugar needed for espresso"
  end
end

# The CappuccinoCoffeeBrewer class represents the cappuccino coffee brewer, and
# overrides specific steps of the coffee brewing algorithm defined in the
# AbstractCoffeeBrewer class.
class CappuccinoCoffeeBrewer < AbstractCoffeeBrewer
  def grind_coffee_beans
    puts "Grinding cappuccino beans"
  end

  def heat_water
    puts "Heating water for cappuccino"
  end

  def pour_water
    puts "Pouring hot water over cappuccino beans"
  end

  def add_coffee_to_cup
    puts "Adding cappuccino to cup"
  end

  def add_milk_and_sugar
    puts "Adding milk and sugar to cappuccino"
  end
end

# The LatteCoffeeBrewer class represents the latte coffee brewer, and overrides
# specific steps of the coffee brewing algorithm defined in the
# AbstractCoffeeBrewer class.
class LatteCoffeeBrewer < AbstractCoffeeBrewer
  def grind_coffee_beans
    puts "Grinding latte beans"
  end

  def heat_water
    puts "Heating water for latte"
  end

  def pour_water
    puts "Pouring hot water over latte beans"
  end

  def add_coffee_to_cup
    puts "Adding latte to cup"
  end

  def add_milk_and_sugar
    puts "Adding milk and sugar to latte"
  end
end

# The client code can use the AbstractCoffeeBrewer class to brew different
# types of coffee, and the coffee brewer's behavior will change depending on
# its concrete subclass.
coffee_brewer = EspressoCoffeeBrewer.new
coffee_brewer.brew_coffee
# Output:
# Grinding espresso beans
# Heating water for espresso
# Pouring hot water over espresso beans
# Adding espresso to cup
# No milk or sugar needed for espresso

coffee_brewer = CappuccinoCoffeeBrewer.new
coffee_brewer.brew_coffee
# Output:
# Grinding cappuccino beans
# Heating water for cappuccino
# Pouring hot water over cappuccino beans
# Adding cappuccino to cup
# Adding milk and sugar to cappuccino

coffee_brewer = Latte
coffee_brewer = LatteCoffeeBrewer.new
coffee_brewer.brew_coffee
# Output:
# Grinding latte beans
# Heating water for latte
# Pouring hot water over latte beans
# Adding latte to cup
# Adding milk and sugar to latte

# In this example, the AbstractCoffeeBrewer class defines the structure of the coffee brewing algorithm in the brew_coffee method,
# and provides abstract methods that represent specific steps of the algorithm that can be overridden by concrete subclasses. The
# EspressoCoffeeBrewer, CappuccinoCoffeeBrewer, and LatteCoffeeBrewer classes are concrete subclasses of the AbstractCoffeeBrewer class
# that override specific steps of the coffee brewing algorithm defined in the AbstractCoffeeBrewer class.
#
# The client code can use the AbstractCoffeeBrewer class to brew different types of coffee, and the coffee brewer's behavior will change
# depending on its concrete subclass. When the client code calls the brew_coffee method on an instance of the EspressoCoffeeBrewer class,
# it will execute the coffee brewing algorithm defined in the brew_coffee method, but with the specific steps of the algorithm defined in the
# EspressoCoffeeBrewer class.
#
# In summary, the Template design pattern defines the skeleton of an algorithm in an operation, but lets subclasses override specific steps
# of the algorithm without changing its structure. It is often used to implement a standard interface for a group of related algorithms,
# and to allow users to select the appropriate algorithm at runtime.