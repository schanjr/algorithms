# The Flyweight design pattern is a structural design pattern that allows you to create and manage a large number of similar objects efficiently.
# It does this by storing the object's intrinsic state (i.e. the state that is independent of the object's context) separately from the object, and
# sharing the object's extrinsic state (i.e. the state that depends on the object's context) among the objects.
#
# Imagine that you are building a system for a text editor that allows users to create and edit documents. The system has a set of classes that
# represent the various elements that can be included in a document (e.g. characters, words, and paragraphs), and a set of classes that represent
# the various formatting options that can be applied to these elements (e.g. font, size, and color).
#
# To implement this scenario using the Flyweight design pattern, you could define a Character class that represents a character in a document, and
# a CharacterFactory class that creates and stores the Character objects. The Character class has an initialize method that takes a character value
# as an argument, and a render method that takes a font, size, and color as arguments and returns a string representation of the character with the
# specified formatting applied.
#
# The Character class represents a character in a document. It has an
# initialize method that takes a character value as an argument, and a render
# method that takes a font, size, and color as arguments and returns a string
# representation of the character with the specified formatting applied.
class Character
  def initialize(value)
    @value = value
  end

  def render(font, size, color)
    "#{font}:#{size}:#{color}:#{@value}"
  end
end

# The CharacterFactory class creates and stores the Character objects. It has
# a get method that takes a character value as an argument and returns the
# corresponding Character object. If the Character object does not exist, it
# creates it and stores it in a hash.
class CharacterFactory
  def initialize
    @characters = {}
  end

  def get(value)
    @characters[value] ||= Character.new(value)
  end
end

# In this example, the Character class represents a character in a document, and the CharacterFactory class creates and stores the Character objects.
# The Character class has an initialize method that takes a character value as an argument, and a render method that takes a font, size, and color
# as arguments and returns a string representation of the character with the specified formatting applied.
#
# The CharacterFactory class has a get method that takes a character value as an argument and returns the corresponding Character object. If the
# Character object does not exist, it creates it and stores it in a hash. This allows the CharacterFactory to efficiently manage a large number of
# Character objects, and reduces the memory usage of the system.
#
