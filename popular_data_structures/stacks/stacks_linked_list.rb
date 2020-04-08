class Node
  attr_accessor :data, :next

  def initialize(data)
    @data = data
    @next = nil
  end
end

class LinkedList
  attr_accessor :first_node

  alias :pop :dequeue
  alias :push :enqueue

  def initialize(data)
    @first_node = Node.new(data)
  end

  # O(N) to insert to the end
  def insert_end(value)
    new_node = Node.new(value)
    curr_node = @first_node
    # First Node will be null
    return new_node if curr_node.nil?

    # Go to the last node then, add the next reference.
    curr_node = curr_node.next until curr_node.next.nil?
    curr_node.next = new_node
    @first_node
  end

  # O(1)
  def enqueue(value)
    new_node = Node.new(value)
    new_node.next = @first_node
    @first_node = new_node
    @first_node
  end

  def dequeue
    node = @first_node
    @first_node = @first_node.next
    node
  end

  def display(head = @first_node)
    current = head
    while current
      print current.data, " "
      current = current.next
    end
  end

  def removeDuplicates
    head = @first_node
    array = []
    return if head.nil?
    node = head
    prev_node = nil
    while !node.nil?
      if array.include?(node.data)
        prev_node.next = node.next
      else
        array << node.data
        prev_node = node
      end
      node = node.next
    end
    return head
  end
end

class Stacks < LinkedList
end

my_list = Stacks.new(1)
[1,2,2,2,3,3,4].each do |data|
  my_list.insert_end(data)
end
my_list.removeDuplicates
my_list.display
puts
my_list.enqueue(5)
my_list.display

