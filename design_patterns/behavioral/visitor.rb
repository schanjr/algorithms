# The Visitor design pattern allows you to define a new operation on an object structure without changing the classes of the objects in the structure.
# It separates the algorithm that operates on the elements of an object structure from the object structure itself.
#
# The elements in the object structure are called "concrete elements", and they define an accept operation that takes a visitor as an argument.
# The visitor is an object that defines a set of visiting methods, each of which corresponds to a concrete element class. The accept operation
# directs a call to the appropriate visiting method in the visitor object.
#
# The object structure is a composite of concrete elements, and it iterates over its elements and calls their accept operations with the visitor object.
# Real-world example:
#
# Imagine you are a customer at a grocery store and you have a shopping list with you. You go to different aisles and pick up items from your
# list one by one. Once you are done shopping, you go to the cashier and the cashier adds up the price of all the items and gives you the total
# amount to pay.
#
# In this example, you are the visitor, the shopping list is the element, and the grocery store is the object structure. The aisles represent
# the concrete elements, and the cashier represents the concrete visitor.
#
# The Element interface declares accept method, which should take a visitor as
# an argument.
class Element
  def accept(_visitor)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

# Concrete Elements implement accept method in such a way that it calls the
# visitor's visit method and passes itself as an argument.
class ConcreteElementA < Element
  # @param [Visitor] visitor
  def accept(visitor)
    visitor.visit_concrete_element_a(self)
  end

  # ConcreteElementA-specific method
  def operation_a
    puts "ConcreteElementA.operation_a"
  end
end

class ConcreteElementB < Element
  # @param [Visitor] visitor
  def accept(visitor)
    visitor.visit_concrete_element_b(self)
  end

  # ConcreteElementB-specific method
  def operation_b
    puts "ConcreteElementB.operation_b"
  end
end

# The Visitor interface declares a set of visiting methods that correspond to
# component classes. The signature of a visiting method allows the visitor to
# identify the exact class of the component that it's dealing with.
class Visitor
  def visit_concrete_element_a(_element)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def visit_concrete_element_b(_element)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

# Concrete Visitors implement several versions of the same algorithm, which can
# work with all concrete component classes.
#
# You can experience the biggest benefit of the Visitor pattern when using it
# with a complex object structure, such as an object
# The client code can run visitor operations over any set of elements without
# figuring out their concrete classes. The accept operation directs a call to
# the appropriate operation in the visitor object.
def client_code(elements, visitor)
  elements.each { |e| e.accept(visitor) }
end

# Object structure can enumerate its elements, and "accept" each of them.
def object_structure
  [ConcreteElementA.new, ConcreteElementB.new]
end

# The client code can create a visitor and pass it to the object structure,
# which will call back the visitor's visit methods as it enumerates its elements.
# Depending on the visitor's type, the right version of visit operation will be
# called.
visitor1 = ConcreteVisitor1.new
visitor2 = ConcreteVisitor2.new

client_code(object_structure, visitor1)
client_code(object_structure, visitor2)

# Output:
# ConcreteVisitor1.visit_concrete_element_a
# ConcreteElementA.operation_a
# ConcreteVisitor1.visit_concrete_element_b
# ConcreteElementB.operation_b
# ConcreteVisitor2.visit_concrete_element_a
# ConcreteElementA.operation_a
# ConcreteVisitor2.visit_concrete_element_b
# ConcreteElementB.operation_b

# In this example, the object structure is a composite of concrete elements, and it iterates over its elements and calls their accept
# operations with the visitor objects. The concrete elements define the accept operation in such a way that it calls the visitor's visit
# method and passes itself as an argument. The visitor is an object that defines a set of visiting methods, each of which corresponds to
# a concrete element class.
#
# The client code can run visitor operations over any set of elements without figuring out their concrete classes. The accept operation
# directs a call to the appropriate operation in the visitor object. Depending on the visitor's type, the right version of the visit operation
# will be called.
#
# In this example, the client code creates two visitor objects and passes them to the object structure, which will call back the visitor's
# visit methods as it enumerates its elements.
#
# The Visitor design pattern is useful when you need to perform an operation on the elements of an object structure, but the elements have
# different types and you don't want to clutter their code with operations that are specific to the visitor. It's also useful when you need
# to perform operations on the elements of an object structure, but you don't want to change the elements' classes.