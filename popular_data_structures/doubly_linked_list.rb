class Node
  attr_accessor :data, :next, :prev

  def initialize(data)
    @data = data
    @next = nil
    @prev = nil
  end
end

# This implementation is memory intensive
class DoublyLinkedList
  attr_accessor :first_node, :last_node

  def initialize(data)
    # You can imagine of @first_node is the node all the way to the left
    # @last_node is all the way to the right.
    @first_node = Node.new(data)
    @last_node = nil
  end

  def initial_populate(value)
    new_node = Node.new(value)
    curr_node = @first_node
    # First Node will be null
    return new_node if curr_node.nil?

    # Go to the last node then, add the next reference.
    curr_node = curr_node.next until curr_node.next.nil?
    curr_node.next = new_node
    new_node.prev = curr_node
    @last_node = new_node
    @first_node
  end


  def insert_head(data)
    new_node = Node.new(data)
    curr_node = @first_node
    curr_node.prev = new_node
    new_node.next = curr_node
    @first_node = new_node
  end

  def insert_tail(data)
    new_node = Node.new(data)
    curr_node = @last_node
    curr_node.next = new_node
    new_node.prev = curr_node
    @last_node = new_node
  end

  def display_next(node = @first_node)
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
my_list.display_next(my_list.first_node)
my_list.insert_tail(66)
my_list.display_next(my_list.last_node)
