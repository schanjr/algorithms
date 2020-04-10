# class Node
#   attr_accessor :data, :next
#
#   def initialize(data)
#     @data = data
#     @next = nil
#   end
# end
#
# class LinkedList
#   attr_accessor :last_node
#
#   alias :pop :dequeue
#   alias :push :enqueue
#
#   def initialize(data=nil)
#     @last_node = Node.new(data)
#   end
#
#   # O(N) to insert to the end
#   def insert(value)
#     new_node = Node.new(value)
#     curr_node = @last_node
#     # First Node will be null
#     return new_node if curr_node.nil?
#
#     # Go to the last node then, add the next reference.
#     curr_node = curr_node.next until curr_node.next.nil?
#     curr_node.next = new_node
#     @last_node
#   end
#
#   def display(head = @last_node)
#     current = head
#     while current
#       print current.data, " "
#       current = current.next
#     end
#   end
# end
#
# class Stacks < LinkedList
# end
#
# my_list = Stacks.new(1)
# [1,2,2,2,3,3,4].each do |data|
#   my_list.insert_end(data)
# end
# my_list.remove_duplicates
# my_list.display
# puts
# my_list.enqueue(5)
# my_list.display
#
