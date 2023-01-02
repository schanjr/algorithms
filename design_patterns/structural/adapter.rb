# The Adapter design pattern is a structural design pattern that allows you to adapt one interface to another,
# allowing classes to work together that couldn't otherwise because of incompatible interfaces.
# he Adapter design pattern allows you to adapt the interface of a class to another interface that clients expect.
# It's used to integrate classes that couldn't be integrated due to incompatible interfaces.
#
# Imagine you are traveling to a foreign country and you need to charge your phone. You bring your phone charger with you, but the
# outlet in the hotel room has a different shape than the one you are used to. In order to charge your phone, you need to use an adapter
# that converts the shape of the outlet to the shape of your charger.
#
# In this example, the adapter is the object that converts the interface of the outlet to the interface of the charger. The outlet is the
# adaptee, and the charger is the target interface.

# The Target defines the domain-specific interface used by the client code.
class Target
  # @abstract
  def request
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

# The Adaptee contains some useful behavior, but its interface is incompatible
# with the existing client code. The Adaptee needs some adaptation before the
# client code can use it.
class Adaptee
  def specific_request
    puts 'Adaptee.specific_request'
  end
end

# The Adapter makes the Adaptee's interface compatible with the Target's
# interface.
class Adapter < Target
  # @param [Adaptee] adaptee
  def initialize(adaptee)
    @adaptee = adaptee
  end

  def request
    puts 'Adapter.request'
    @adaptee.specific_request
  end
end

# The client code supports all classes that follow the Target interface.
def client_code(target)
  target.request
end

# The client code can work with all concrete classes that follow the Target
# interface.
puts 'Client code: I can work with the Target objects:'
target = Target.new
client_code(target)

adaptee = Adaptee.new
puts "\nClient code: The Adaptee class has a weird interface. See, I don't understand it:"
client_code(adaptee)

puts "\nClient code: But I can work with it via the Adapter:"
adapter = Adapter.new(adaptee)
client_code(adapter)

# Output:
# Client code: I can work with the Target objects:
# NotImplementedError (Target has not implemented method 'request')
#
# Client code: The Adaptee class has a weird interface. See, I don't understand it:
# NoMethodError (undefined method `request' for #<Adaptee:0x00007fa1ce808580>)
#
# Client code: But I can work with it via the Adapter:
# Adapter.request
# Adaptee.specific_request

# In this example, the client code is trying to use the Adaptee class, but it has a different interface than the client expects.
# To make the Adaptee class compatible with the client code, the Adapter class is introduced. The Adapter class has the same interface as
# the Target class and delegates requests to the Adaptee class.
#
# The client code can work with all concrete classes that follow the Target interface, and it can use the Adapter class to work with the
# Adaptee class as well.



