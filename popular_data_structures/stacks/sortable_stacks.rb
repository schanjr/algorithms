require_relative './stacks_linked_list'

# Sort Stack: Write a program to sort a stack such that the smallest items are on the top.
# You can use an additional temporary stack,
# but you may not copy the elements into any other data structure (such as an array).
# The stack supports the following operations: push, pop, peek, and isEmpty?.

class SortableStacks < Stacks
  def sort
    # Separate stack would have the sorted stack.
    temp_stack = Stacks.new
    until self.empty?
      node = self.pop
      if temp_stack.empty?
        temp_stack.push(node.data)
      else
        temp_stack_node = temp_stack.head
        compared = compare(node.data, temp_stack_node.data)
        # Scenario where current node is smaller than all of the nodes in the temp stack
        if compared <= 0
          node.next = temp_stack_node
          temp_stack.head = node
        else
          # Scenario where the insert of the temp stack is somewhere in the middle, we keep iterating
          # until current node can be put between this node and next node
          until compare(node.data, temp_stack_node.data) == 1 && compare(node.data, temp_stack_node.next.data) <= 0
            temp_stack_node = temp_stack_node.next
          end
          temp_stack_node_next = temp_stack_node.next
          temp_stack_node.next = node
          node.next = temp_stack_node_next
        end
      end
    end
    @head = temp_stack.head
  end

  def compare(new_node, temp_stack_node)
    # Compare function can give reverse results if we wanted to sort ASC or DESC
    # result = temp_stack_node <=> new_node
    result = new_node <=> temp_stack_node
    return 0 if result.nil?
    result
  end

  def fancy_sort
    # by Gayle Laakman McDowell
    r = Stacks.new
    s = self
    while !s.empty?
      tmp = s.pop
      # This while loop makes sure tmp variable is smaller than r.peek
      while !r.empty? && r.peek > tmp.data
        s.push(r.pop.data)
      end
      r.push(tmp.data)
    end
    # By this time, the new stack would have all of the sorted data.
    while !r.empty?
      s.push(r.pop.data)
    end
  end
end

# [5, 3, 1, 10, 9]
my_stack = SortableStacks.new
[3, 1, 5, 10, 9].each do |num|
  my_stack.push(num)
end
my_stack.display
my_stack.fancy_sort
my_stack.display


my_stack = SortableStacks.new
[2,4,7,8,6].each do |num|
  my_stack.push(num)
end
my_stack.display
my_stack.sort
my_stack.display
