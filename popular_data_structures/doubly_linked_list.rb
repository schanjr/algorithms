class Node
  attr_accessor :data, :next, :prev

  def initialize(data)
    @data = data
    @next = nil
    @prev = nil
  end
end


# Uses of doubly linked list
# - A music player which has next and prev buttons.
# - Represent a deck of cards in a game.
# - The browser cache which allows you to hit the BACK-FORWARD pages.
# - Applications that have a Most Recently Used list (a linked list of file names)
# - Undo-Redo functionality

# This implementation is memory intensive
class DoublyLinkedList
  attr_accessor :head, :last_node

  def initialize(data)
    # You can imagine of @head is the node all the way to the left
    # @last_node is all the way to the right.
    @head = Node.new(data)
    @last_node = @head
  end

  def initial_populate(value)
    new_node = Node.new(value)
    curr_node = @head
    # First Node will be null
    return new_node if curr_node.nil?

    # Go to the last node then, add the next reference.
    curr_node = curr_node.next until curr_node.next.nil?
    curr_node.next = new_node
    new_node.prev = curr_node
    @last_node = new_node
    @head
  end


  def insert_head(data)
    new_node = Node.new(data)
    curr_node = @head
    curr_node.prev = new_node
    new_node.next = curr_node
    @head = new_node
  end

  def insert_tail(data)
    new_node = Node.new(data)
    curr_node = @last_node
    curr_node.next = new_node
    new_node.prev = curr_node
    @last_node = new_node
  end

  def display_next(node = @head)
    current = node
    while current
      print "-(#{current.data})-"
      current = current.next
    end
  end

  def display_reverse(node = @last_node)
    current = node
    while current
      print "-(#{current.data})-"
      current = current.prev
    end
  end

end

my_list = DoublyLinkedList.new(0)
[1,2,3].each do |data|
  my_list.initial_populate(data)
end

my_list.insert_head(33)
my_list.display_next(my_list.head)
puts
my_list.insert_tail(66)
my_list.display_next(my_list.head)
