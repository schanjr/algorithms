# Imagine that you are building a system for a remote-controlled toy car. The toy car has a set of commands that it
# can understand, such as "move forward," "move backward," "turn left," and "turn right." To control the toy car,
# you can send it a command from a remote control.
#
#   To implement this scenario using the Command design pattern, you could define a Command class that represents a
# command that the toy car can understand, and concrete implementations of the Command class for each type of
# command (e.g. MoveForwardCommand, MoveBackwardCommand, TurnLeftCommand, TurnRightCommand). Each command would have a
# method for executing the corresponding action on the toy car.
#
#   You could also define a RemoteControl class that represents the remote control and has a method for sending a
# command to the toy car. The RemoteControl class would have a send_command method that accepts a Command object and calls
# its execute method.

# The base Command class declares an interface for executing a command.
class Command
  def execute
    raise NotImplementedError, "You must implement #{self.class}##{__method__}"
  end
end

# Concrete Commands implement the execute method by calling the corresponding
# method on the Receiver.
class MoveForwardCommand < Command
  def initialize(receiver)
    @receiver = receiver
  end

  def execute
    @receiver.move_forward
  end
end

class MoveBackwardCommand < Command
  def initialize(receiver)
    @receiver = receiver
  end

  def execute
    @receiver.move_backward
  end
end

class TurnLeftCommand < Command
  def initialize(receiver)
    @receiver = receiver
  end

  def execute
    @receiver.turn_left
  end
end

class TurnRightCommand < Command
  def initialize(receiver)
    @receiver = receiver
  end

  def execute
    @receiver.turn_right
  end
end

# The Receiver class knows how to perform the operations associated with
# carrying out a request. It has methods for each type of command.
class ToyCar
  def move_forward
    puts 'Toy car: Moving forward'
  end

  def move_backward
    puts 'Toy car: Moving backward'
  end

  def turn_left
    puts 'Toy car: Turning left'
  end

  def turn_right
    puts 'Toy car: Turning right'
  end
end

# The RemoteControl class asks the command to carry out the request.
class RemoteControl
  def send_command(command)
    command.execute
  end
end

# The client code creates a Receiver, creates Command objects, and sets their
# Receiver.
toy_car = ToyCar.new
move_forward_command = MoveForwardCommand.new(toy_car)
move_backward_command = MoveBackwardCommand.new(toy_car)
turn_left_command = TurnLeftCommand.new(toy_car)
turn_right_command = TurnRightCommand.new(toy_car)

# The client code creates a RemoteControl, sets a Command, and asks the
# RemoteControl to execute the command.
remote_control = RemoteControl.new
remote_control.send_command(move_forward_command)
remote_control.send_command(turn_left_command)
remote_control.send_command(move_backward_command)
remote_control.send_command(turn_right_command)

# In this example, the Command class declares an interface for executing a command, and the MoveForwardCommand,
# MoveBackwardCommand, TurnLeftCommand, and TurnRightCommand classes are concrete implementations of the Command class
# that execute the corresponding action on the ToyCar receiver. The ToyCar class knows how to perform the operations
# associated with carrying out a request, and has methods for each type of command. The RemoteControl class asks the
# command to carry out the request by calling its execute method.
#
# The client code creates a ToyCar object, creates Command objects and sets their receiver to the ToyCar object,
# creates a RemoteControl object, sets a Command object, and asks the RemoteControl to execute the command. When
# the send_command method is called on the RemoteControl object, it passes the request to the Command object, which
# then calls the corresponding method on the ToyCar receiver.


