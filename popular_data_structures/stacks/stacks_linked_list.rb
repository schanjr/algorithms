require_relative '../linked_list'

class Stacks < LinkedList
  # create common methods in Stacks such as: enqueue, dequeue, push, pop, peek, and isEmpty
  alias :dequeue :remove_front
  alias :enqueue :insert_front

  alias :pop :dequeue
  alias :push :enqueue

  def peek
    return @first_node.data
  end

  def empty?
    @first_node.data.nil?
  end
end

# my_list = Stacks.new(1)
# [1,2,2,2,3,3,4].each do |data|
#   my_list.insert_end(data)
# end
# my_list.removeDuplicates
# my_list.display
# my_list.enqueue(5)
# my_list.display
# my_list.dequeue
# my_list.dequeue
# my_list.dequeue
# my_list.dequeue
# my_list.display
# my_list.dequeue
# my_list.display


