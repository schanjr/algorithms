# The Facade design pattern is a structural design pattern that provides a simplified interface to a complex
# system, hiding the complexity of the system and making it easier to use. The Facade design pattern is often used
# to provide a high-level interface to a large body of code, allowing client code to work with the system more easily,
# and to reduce the dependency of the client code on the implementation details of the system.

# Imagine that you are building a system for a restaurant that allows customers to place orders for food and drinks.
# The system has a set of classes that represent the various items on the menu (e.g. burgers, pizzas, and drinks),
# and a set of classes that represent the various ways that orders can be placed (e.g. in-person, online, and via phone).
#
# To implement this scenario using the Facade design pattern, you could define a Menu class that represents the menu,
# and a OrderFacade class that represents the simplified interface to the system. The Menu class has methods for
# retrieving the various items on the menu, and the OrderFacade class has methods for placing orders in-person,
# online, and via phone, which delegate to the appropriate classes in the system.
# The Menu class represents the menu. It has methods for retrieving the
# various items on the menu.
class Menu
  def burgers
    ['Cheeseburger', 'Hamburger', 'Veggie Burger']
  end

  def pizzas
    ['Pepperoni', 'Margherita', 'Veggie']
  end

  def drinks
    ['Soda', 'Beer', 'Wine']
  end
end

# The OrderFacade class represents the simplified interface to the system. It
# has methods for placing orders in-person, online, and via phone, which
# delegate to the appropriate classes in the system.
class OrderFacade
  attr_reader :menu

  def initialize
    @menu = Menu.new
  end

  def place_in_person_order(items)
    # Code for placing in-person orders goes here...
  end

  def place_online_order(items)
    # Code for placing online orders goes here...
  end

  def place_phone_order(items)
    # Code for placing phone orders goes here...
  end
end

# The client code can work with the OrderFacade object, allowing it to place
# orders without having to worry about the complexity of the system.
facade = OrderFacade.new
items = facade.menu.burgers + facade.menu.pizzas + facade.menu.drinks
facade.place_online_order(items)


# In this example, the Menu class represents the menu, and the OrderFacade class represents the simplified interface to
# the system. The Menu class has methods for retrieving the various items on the menu, and the OrderFacade class
# has methods for placing orders in-person, online, and via phone, which delegate to the appropriate classes in the system.
#
#   The OrderFacade class has a reference to a Menu object, and its methods use the Menu object to retrieve the items
# that the customer has selected.
#   This allows the client code to work with the OrderFacade object, allowing it to place orders without having to
# worry about the complexity of the system. The client code can retrieve the items on the menu using the Menu object,
# and then pass the selected items to the appropriate method on the OrderFacade object to place the order.
#
#  In this example, the OrderFacade class acts as a facade, providing a simplified interface to the system, and hiding
# the complexity of the system from the client code. This makes it easier for the client code to work with the system,
# and reduces the dependency of the client code on the implementation details of the system.