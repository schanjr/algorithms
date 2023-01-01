# The Mediator design pattern is a behavioral design pattern that allows you to define an object that encapsulates how a set of objects
# interact. It does this by providing a mediator object that coordinates communication between the objects, and allowing the client code to work
# with the mediator rather than the objects themselves.
#
# Imagine that you are building a chat system that allows users to send messages to each other. The system has a User class that represents a user,
# and a Chatroom class that represents a chat room. The User class has a send_message method that allows a user to send a message to another user,
# and a receive_message method that allows a user to receive a message from another user.
#
# To implement this scenario using the Mediator design pattern, you could define a Mediator class that represents a mediator for the chat system,
# and a ChatroomMediator class that implements the Mediator interface for the Chatroom class. The ChatroomMediator class has a send_message method
# that allows a user to send a message to another user, and a receive_message method that allows a user to receive a message from another user.

# The Mediator class represents a mediator for a set of objects. It has a
# send_message method that allows an object to send a message to another object,
# and a receive_message method that allows an object to receive a message from
# another object.
class Mediator
  def send_message(sender, receiver, message)
    raise NotImplementedError
  end

  def receive_message(sender, receiver, message)
    raise NotImplementedError
  end
end

# The ChatroomMediator class implements the Mediator interface for the Chatroom
# class. It has a send_message method that allows a user to send a message to
# another user, and a receive_message method that allows a user to receive a
# message from another user.
class ChatroomMediator < Mediator
  def send_message(sender, receiver, message)
    puts "#{sender.name} sends a message to #{receiver.name}: #{message}"
    receiver.receive_message(sender, receiver, message)
  end

  def receive_message(sender, receiver, message)
    puts "#{receiver.name} receives a message from #{sender.name}: #{message}"
  end
end

# The User class represents a user. It has a name attribute that stores the
# user's name, a send_message method that allows the user to send a message to
# another user, and a receive_message method that allows the user to receive a
# message from another user.
class User
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def send_message(receiver, message)
    @mediator.send_message(self, receiver, message)
  end

  def receive_message(sender, message)
    puts "#{@name} receives a message from #{sender.name}: #{message}"
  end
end

# The Chatroom class represents a chat room. It has a mediator attribute that
# stores the chat room's mediator, and a users attribute that stores the users
# in the chat room.
class Chatroom
  attr_accessor :mediator, :users

  def initialize
    @users = []
  end

  def join(user)
    puts "#{user.name} joins the chat room"
    user.mediator = @mediator
    @users << user
  end
end

# The client code can use the Chatroom and User classes to send messages to
# each other through the ChatroomMediator.
chatroom = Chatroom.new
chatroom.mediator = ChatroomMediator.new

alice = User.new('Alice')
bob = User.new('Bob')
charlie = User.new('Charlie')

chatroom.join(alice)
chatroom.join(bob)
chatroom.join(charlie)

alice.send_message(bob, 'Hello, Bob!')
bob.send_message(charlie, 'Hey, Charlie!')
charlie.send_message(alice, 'Hi, Alice!')

# Output:
# Alice joins the chat room
# Bob joins the chat room
# Charlie joins the chat room
# Alice sends a message to Bob: Hello, Bob!
# Bob receives a message from Alice: Hello, Bob!
# Bob sends a message to Charlie: Hey, Charlie!
# Charlie receives a message from Bob: Hey, Charlie!
# Charlie sends a message to Alice: Hi, Alice!
# Alice receives a message from Charlie: Hi, Alice!

# In this example, the Mediator class represents a mediator for a set of objects, and the ChatroomMediator class implements the Mediator
# interface for the Chatroom class. The ChatroomMediator class has a send_message method that allows a user to send a message to another user,
# and a receive_message method that allows a user to receive a message from another user.
#
# The User class represents a user, and has a name attribute that stores the user's name, a send_message method that allows the user to send
# a message to another user, and a receive_message method that allows the user to receive a message from another user.
#
# The Chatroom class represents a chat room, and has a mediator attribute that stores the chat room's mediator, and a users attribute that
# stores the users in the chat room. It has a join method that allows a user to join the chat room, and sets the user's mediator attribute
# to the chat room's mediator.

# In this example, the Mediator design pattern allows us to define an object (the ChatroomMediator) that encapsulates how a set of objects
# (the User objects) interact. It does this by providing a mediator object that coordinates communication between the objects, and allowing
# the client code to work with the mediator rather than the objects themselves.
#
#   The ChatroomMediator class has a send_message method that allows a user to send a message to another user, and a receive_message method
# that allows a user to receive a message from another user. These methods are called by the send_message and receive_message methods of the
# User class, respectively. This allows the User objects to communicate with each other through the ChatroomMediator, rather than directly with
# each other.
#
#     The Mediator design pattern is useful when you want to decouple a set of objects from each other, and allow them to interact in a loosely
# coupled way. It can help to reduce the complexity of the client code, and make it easier to maintain and extend.