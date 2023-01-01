# The Interpreter design pattern is a behavioral design pattern that allows you to define a grammar for a simple language, and use it to interpret
# sentences in that language. It does this by defining a set of syntax rules for the language, and providing an interpreter that can parse and execute
# the commands in a given sentence.
#
# Imagine that you are building a system for a simple calculator that allows users to perform basic mathematical operations. The system has a set
# of classes that represent the various operations that can be performed (e.g. addition, subtraction, multiplication, and division), and a set of
# classes that represent the syntax of the language used to perform these operations (e.g. numbers, parentheses, and operators).
#
# To implement this scenario using the Interpreter design pattern, you could define an Expression class that represents an expression in the language,
# and a Context class that holds the context in which the expression is being interpreted. The Expression class has an evaluate method that takes a
# Context object as an argument and returns the result of the expression.

# The Expression class represents an expression in the language. It has an
# evaluate method that takes a Context object as an argument and returns the
# result of the expression.
class Expression
  def evaluate(context)
    raise NotImplementedError
  end
end

# The Number class represents a number in the language. It has an evaluate
# method that returns the value of the number.
class Number < Expression
  def initialize(value)
    @value = value
  end

  def evaluate(context)
    @value
  end
end

# The Add class represents the addition operation in the language. It has an
# evaluate method that returns the sum of the values of the left and right
# expressions.
class Add < Expression
  def initialize(left, right)
    @left = left
    @right = right
  end

  def evaluate(context)
    @left.evaluate(context) + @right.evaluate(context)
  end
end

# The Subtract class represents the subtraction operation in the language. It
# has an evaluate method that returns the difference between the values of the
# left and right expressions.
class Subtract < Expression
  def initialize(left, right)
    @left = left
    @right = right
  end

  def evaluate(context)
    @left.evaluate(context) - @right.evaluate(context)
  end
end

# The Multiply class represents the multiplication operation in the language.
# It has an evaluate method that returns the product of the values of the left
# and right expressions.
class Multiply < Expression
  def initialize(left, right)
    @left = left
    @right = right
  end

  def evaluate(context)
    @left.evaluate(context) * @right.evaluate(context)
  end
end

# The Divide class represents the division operation in the language. It has an
# evaluate method that returns the quotient of the values of the left and right
# expressions.
class Divide < Expression
  def initialize(left, right)
    @left = left
    @right = right
  end

  def evaluate(context)
    @left.evaluate(context) / @right.evaluate(context)
  end
end

# The Context class holds the context in which the expression is being
# interpreted. It has a stack that stores the values of the expressions as they
# are evaluated.
class Context
  def initialize
    @stack = []
  end

  def push(value)
    @stack.push(value)
  end

  def pop
    @stack.pop
  end
end

# The client code can create and interpret expressions in the language.
context = Context.new

expression = Add.new(Number.new(1), Number.new(2))
result = expression.evaluate(context)
puts result # => 3

expression = Subtract.new(Number.new(5), Number.new(3))
result = expression.evaluate(context)
puts result # => 2

expression = Multiply.new(Number.new(4), Number.new(6))
result = expression.evaluate(context)
puts result # => 24

expression = Divide.new(Number.new(9), Number.new(3))
result = expression.evaluate(context)
puts result # => 3

# In this example, the Expression class represents an expression in the language, and the Context class holds the context in which
# the expression is being interpreted. The Expression class has an evaluate method that takes a Context object as an argument and
# returns the result of the expression.
#
# The Number, Add, Subtract, Multiply, and Divide classes represent the various elements of the language (e.g. numbers, operators, and parentheses),
# and have evaluate methods that return the appropriate result for the element.
#
# The Context class has a stack that stores the values of the expressions as they are evaluated. This allows the Context class to keep track of the
# state of the evaluation process, and makes it easier for the client code to work with the system.
