class Node
  attr_accessor :data, :next, :prev

  def initialize(data)
    @data = data
    @next = nil
    @prev = nil
  end
end

# This implementation is memory intensive
class LinkedList
  attr_accessor :first_node

  def initialize(data)
    @first_node = Node.new(data)
  end

end
