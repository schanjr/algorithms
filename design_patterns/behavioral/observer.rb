# The Observer design pattern is a behavioral design pattern that allows objects to subscribe to and receive notifications from other objects.
# It is often used to implement event-driven systems, where objects can publish events and other objects can subscribe to and receive notifications
# of those events.
#
#   Here's a summary of the Observer pattern:
#
# The Observer pattern allows objects to subscribe to and receive notifications from other objects.
# It is often used to implement event-driven systems, where objects can publish events and other objects can subscribe to and receive notifications
# of those events.
# The Observer pattern consists of a subject class and observer classes.
# The subject class maintains a list of observer objects, and provides methods to subscribe and unsubscribe observers.
# The observer classes implement a notification method that is called by the subject when an event occurs.
#
# Here's an example of the Observer design pattern in Ruby for a social media scenario, with a real-world example to illustrate the concept:
#
# Imagine you are building a social media application where users can follow other users, and receive notifications when the users they are
# following post new updates.
#
# To implement this feature, you could use the Observer design pattern to allow users to subscribe to and receive notifications from other users.
#
# The User class represents a user in the social media application. It has a
# name attribute that stores the user's name, and a posts attribute that stores
# the user's posts. It has a post method that allows the user to create a new
# post, and a notify_followers method that notifies the user's followers of the
# new post.
# The User class represents a user in the social media application. It has a
# name attribute that stores the user's name, and a posts attribute that stores
# the user's posts. It has a post method that allows the user to create a new
# post, and a notify_followers method that notifies the user's followers of the
# new post.
class User
  attr_reader :name, :posts
  attr_accessor :observers

  def initialize(name)
    @name = name
    @posts = []
    @observers = []
  end

  def post(post)
    @posts << post
    notify_followers
  end

  def subscribe(observer)
    @observers << observer
  end

  def unsubscribe(observer)
    @observers.delete(observer)
  end

  def notify_followers
    @observers.each do |observer|
      observer.update(self, @posts.last)
    end
  end
end

# The UserObserver class represents an observer of a user. It has an update
# method that is called by the user when an event occurs.
class UserObserver
  def update(user, post)
    puts "Received update from #{user.name}: #{post}"
  end
end

# The client code can use the User and UserObserver classes to subscribe
# observers to users, and receive updates from those users.
user1 = User.new('Alice')
user2 = User.new('Bob')

observer = UserObserver.new

user1.subscribe(observer)

user1.post('Hello, world!')
# Output:
# Received update from Alice: Hello, world!

user1.unsubscribe(observer)

user1.post('Hi, how are you?')

user2.subscribe(observer)

user2.post('Hey, what"s up?')
# Output:
# Received update from Bob: Hey, what's up?

user2.unsubscribe(observer)

user2.post('Nothing much, just hanging out.')

user1.subscribe(observer)

user1.post('I am fine, thank you.')
# Output:
# Received update from Alice: I am fine, thank you.


#
# In this example, the User class represents a user in the social media application, and the UserObserver class represents an observer of a user.
# The User class has a subscribe and unsubscribe method that allows observers to subscribe and unsubscribe from the user, and a notify_followers
# method that notifies the user's followers of new posts. The UserObserver class has an update method that is called by the user when a new post
# is made.
#
# Using the Observer design pattern in this way allows the social media application to notify subscribers of new posts made by the users they are
# following. This can improve the user experience of the application by allowing users to receive updates in real-time, rather than having to
# constantly refresh the page to check for new content.