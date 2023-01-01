# The Factory Method design pattern is a creational design pattern that defines an interface for creating an object,
# but allows subclasses to alter the type of objects that will be created. The Factory Method design pattern is
# often used to create objects in a super class, but allow subclasses to alter the type of objects that will be created.
#
# Imagine that you are building a system for a pet store that allows customers to purchase different types of pets.
# The system has a set of classes that represent the various types of pets that are available (e.g. dogs, cats, and birds),
# and a set of classes that represent the various ways that pets can be purchased (e.g. in-person, online, and via phone).
#
# To implement this scenario using the Factory Method design pattern, you could define an Animal class that represents a pet,
# and a PetStore class that represents the store. The Animal class has an abstract speak method, and the PetStore class has
# an abstract purchase_pet method, which is the factory method. The PetStore class also has concrete implementations for the
# in-person, online, and phone purchase methods, which use the purchase_pet factory method to create the appropriate Animal object.

# The Animal class represents a pet. It has an abstract speak method.
class Animal
  def speak
    raise NotImplementedError
  end
end

# The Dog class represents a dog. It has a speak method that returns a
# string indicating that the dog is barking.
class Dog < Animal
  def speak
    'Bark!'
  end
end

# The Cat class represents a cat. It has a speak method that returns a
# string indicating that the cat is meowing.
class Cat < Animal
  def speak
    'Meow!'
  end
end

# The Bird class represents a bird. It has a speak method that returns a
# string indicating that the bird is tweeting.
class Bird < Animal
  def speak
    'Tweet!'
  end
end

# The PetStore class represents the store. It has an abstract purchase_pet
# method, which is the factory method, and concrete implementations for the
# in-person, online, and phone purchase methods, which use the purchase_pet
# factory method to create the appropriate Animal object.
class PetStore
  def self.purchase_pet(type)
    raise NotImplementedError
  end

  def self.purchase_in_person(type)
    purchase_pet(type)
  end

  def self.purchase_online(type)
    purchase_pet(type)
  end

  def self.purchase_phone(type)
    purchase_pet(type)
  end
end

# The DogStore class represents a store that sells dogs. It has a purchase_pet
# method that creates a new Dog object.
class DogStore < PetStore
  def self.purchase_pet(type)
    Dog.new
  end
end

# The CatStore class represents a store that sells cats. It has a purchase_pet
# method that creates a new Cat object.
class CatStore < PetStore
  def self.purchase_pet(type)
    Dog.new
  end
end

# The Fish class represents a fish. It has a speak method that returns a
# string indicating that the fish is silent.
class Fish < Animal
  def speak
    '...'
  end
end

# The FishStore class represents a store that sells fish. It has a purchase_pet
# method that creates a new Fish object.
class FishStore < PetStore
  def self.purchase_pet(type)
    Fish.new
  end
end

# The client code can work with the PetStore class, allowing it to purchase
# pets without having to worry about the complexity of the system.
dog_store = DogStore.new
cat_store = CatStore.new
bird_store = BirdStore.new
fish_store = FishStore.new

dog = dog_store.purchase_in_person('dog')
cat = cat_store.purchase_online('cat')
bird = bird_store.purchase_phone('bird')
fish = fish_store.purchase_in_person('fish')

puts dog.speak
puts cat.speak
puts bird.speak
puts fish.speak

# In this example, the Animal class represents a pet, and the PetStore class represents the store. The Animal class has
# an abstract speak method, and the PetStore class has an abstract purchase_pet method, which is the factory method. The
# PetStore class also has concrete implementations for the in-person, online, and phone purchase methods, which use the
# purchase_pet factory method to create the appropriate Animal object.
#
#   The DogStore class represents a store that sells dogs, and the CatStore class represents a store that sells cats.
# The DogStore class has a purchase_pet method that creates a new Dog object, and the CatStore class has a purchase_pet
# method that creates a new Cat object.
#
#   The BirdStore class represents a store that sells birds, and the FishStore class represents a store that sells fish.
# The BirdStore class has a purchase_pet method that creates a new Bird object, and the FishStore class has a purchase_pet
# method that creates a new Fish object.
#
#   This allows the client code to work with the PetStore class, allowing it to purchase pets without having to worry about
# the complexity of the system. The client code can use the appropriate PetStore subclass to purchase the desired type of pet,
# and the PetStore subclass will use the purchase_pet factory method to create the appropriate Animal object.
#
#   In this example, the PetStore class acts as a factory, and the purchase_pet method acts as the factory method, allowing
# subclasses to alter the type of objects that will be created. This makes it easier for the client code to work with the system,
# and reduces the dependency of the client code on the implementation details of the system.

# In this example, the Fish class represents a fish, and the FishStore class represents a store that sells fish.
# The Fish class has a speak method that returns a string indicating that the fish is silent, and the FishStore
# class has a purchase_pet method that creates a new Fish object.
#
#   The client code can work with the PetStore class, allowing it to purchase pets without having to worry about
# the complexity of the system. The client code can use the appropriate PetStore subclass to purchase the desired
# type of pet, and the PetStore subclass will use the purchase_pet factory method to create the appropriate Animal object.
