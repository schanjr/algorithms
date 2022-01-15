# Singly LinkedList

# Typically implementing LinkedList needs two class.
# One is the Node class that holds the information
# The other is the LinkedList class that is more of a orchestrator that holds the nodes together
class Node
  attr_accessor :data, :next

  def initialize(data)
    @data = data
    @next = nil
  end
end

# This implementation is memory intensive
class LinkedList
  attr_accessor :head

  def initialize(data = nil)
    @head = Node.new(data)
  end

  def reverse_loop(node = head)
    cur, prev = node, nil
    while cur
      cur.next, prev, cur = prev, cur, cur.next
    end
    self.head = prev
  end

  def reverse_recursive(node = head)
    return node if node.nil? || node.next.nil?
    p = reverse_recursive(node.next)
    node.next.next = node
    node.next = nil
    self.head = p
  end

  # O(N) to insert to the end
  def insert_end(value)
    new_node = Node.new(value)
    curr_node = @head
    # First Node will be null
    return new_node if curr_node.nil?

    # Go to the last node then, add the next reference.
    curr_node = curr_node.next until curr_node.next.nil?
    curr_node.next = new_node
    @head
  end

  # O(1)
  def insert_front(value)
    new_node = Node.new(value)
    new_node.next = @head
    @head = new_node
    @head
  end

  # O(1)
  def remove_front
    node = @head
    @head = @head.next
    node
  end

  def display(head = @head)
    puts
    current = head
    while current
      print(current.data, " ")
      current = current.next
    end
    puts
  end

  def remove_duplicates
    head = @head
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

  def merge_list(l2)
    self.head = _merge_list(head, l2)
  end


  def _merge_list(l1, l2)
    if l1.nil? || l2.nil?
      return l1 || l2
    end
    if l1.val < l2.val
      l1.next = _merge_list(l1.next, l2)
      l1
    else
      l2.next = _merge_list(l1, l2.next)
      l2
    end
  end
end

# my_list = LinkedList.new(1)
# [1,2,2,2,3,3,4].each do |data|
#   my_list.insert_end(data)
# end
# my_list.display
# puts "reversing now:::"
# my_list.reverse_recursive
# my_list.display

# https://learning.oreilly.com/library/view/a-common-sense-guide/9781680502794/f_0093.xhtml
# Linked Lists in Action
# One case where linked lists shine is when we examine a single list and delete many elements from
# it. Let’s say, for example, that we’re building an application that combs through lists
# of email
# addresses and removes any email address that has an invalid format. Our algorithm
# inspects each and
# every email address one at a time, and uses a regular expression (a specific pattern for
# identifying certain types of data) to determine whether the email address is invalid. If
# it’s
# invalid, it removes it from the list.
#
# No matter whether the list is an array or a linked list, we need to comb through the
# entire list
# one element at a time to inspect each value, which would take N steps. However, let’s
# examine what
# happens when we actually delete email addresses.
#
# With an array, each time we delete an email address, we need another O(N) steps to shift
# the
# remaining data to the left to close the gap. All this shifting will happen before we can
# even
# inspect the next email address.
#
# So besides the N steps of reading each email address, we need another N steps multiplied
# by invalid
# email addresses to account for deletion of invalid email addresses.
#
# Let’s assume that one in ten email addresses are invalid. If we had a list of 1,000 email
# addresses, there would be approximately 100 invalid ones, and our algorithm would take
# 1,000 steps
# for reading plus about 100,000 steps for deletion (100 invalid email addresses * N).
#
# With a linked list, however, as we comb through the list, each deletion takes just one
# step, as we
# can simply change a node’s link to point to the appropriate node and move on. For our
# 1,000 emails,
# then, our algorithm would take just 1,100 steps, as there are 1,000 reading steps, and
# 100 deletion
# steps.

