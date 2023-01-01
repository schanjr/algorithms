# The State design pattern is a behavioral design pattern that allows objects to change their behavior based on their internal state.
# It is often used to encapsulate complex state-dependent behavior, and to provide a clean interface to that behavior.
#
#   Here's a summary of the State pattern:
#
# The State design pattern allows objects to change their behavior based on their internal state.
# It is often used to encapsulate complex state-dependent behavior, and to provide a clean interface to that behavior.
# The State pattern consists of a state interface and concrete state classes that implement the behavior for each state.
# The state interface defines the behavior that can be performed in each state, and the concrete state classes implement that behavior.
# The context class holds a reference to the current state and delegates behavior to the current state.
# The context class can change its state by setting a new current state.
#
# Here's an example of the State design pattern in Ruby for an order processing scenario, with a real-world example to illustrate the concept:
#
# Imagine you are building an e-commerce application that processes orders. An order can be in one of several states: pending, processing, shipped,
# or delivered. The behavior of an order changes depending on its state, for example, a pending order can be cancelled, but a delivered order
# cannot.
#
# To implement this feature, you could use the State design pattern to create an Order class with an internal state that determines its behavior.
# The Order class has an update_state method that changes its state, and several methods that perform different actions depending on the current
# state of the order.
# The OrderState interface defines the behavior that can be performed in each
# state of an Order.


# The OrderState interface defines the behavior that can be performed in each
# state of an Order.
class OrderState
  def cancel
    raise NotImplementedError
  end

  def process
    raise NotImplementedError
  end

  def ship
    raise NotImplementedError
  end

  def deliver
    raise NotImplementedError
  end
end

# The PendingOrderState class represents the pending state of an Order.
# It implements the behavior for a pending order.
class PendingOrderState < OrderState
  def cancel
    puts 'Cancelling order'
  end

  def process
    puts 'Processing order'
  end
end

# The ProcessingOrderState class represents the processing state of an Order.
# It implements the behavior for a processing order.
class ProcessingOrderState < OrderState
  def ship
    puts 'Shipping order'
  end
end

# The ShippedOrderState class represents the shipped state of an Order.
# It implements the behavior for a shipped order.
class ShippedOrderState < OrderState
  def deliver
    puts 'Delivering order'
  end
end

# The DeliveredOrderState class represents the delivered state of an Order.
# It implements the behavior for a delivered order.
class DeliveredOrderState < OrderState
  def cancel
    puts 'Cannot cancel delivered order'
  end

  def process
    puts 'Cannot process delivered order'
  end

  def ship
    puts 'Cannot ship delivered order'
  end
end

# The Order class holds a reference to the current state of the order, and
# delegates behavior to the current state.
class Order
  attr_reader :state

  def initialize
    @state = PendingOrderState.new
  end

  def update_state(state)
    @state = state
  end

  def cancel
    @state.cancel
  end

  def process
    @state.process
  end

  def ship
    @state.ship
  end

  def deliver
    @state.deliver
  end
end

# The client code can use the Order class to process orders, and the order's
# behavior will change depending on its state.
order = Order.new

order.cancel
# Output: Cancelling order

order.process
# Output: Processing order

order.ship
# Output: Shipping order

order.deliver
# Output: Delivering order

order.update_state(DeliveredOrderState.new)

order.cancel
# Output: Cannot cancel delivered order

order.cancel
# Output: Cancelling order

order.process
# Output: Processing order

order.ship
# Output: Shipping order

order.deliver
# Output: Delivering order


# In this example, the Order class has an internal state that determines its behavior. The Order class has an update_state method that changes its
# state, and several methods that perform different actions depending on the current state of the order. The Order class holds a reference to the
# current state of the order, and delegates behavior to the current state.
#
#   The client code can use the Order class to process orders, and the order's behavior will change depending on its state. For example, an order
# in the pending state can be cancelled and processed, but an order in the delivered state cannot.