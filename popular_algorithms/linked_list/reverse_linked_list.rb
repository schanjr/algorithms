require_relative './list_node'

# Given a singly linked list, reverse it.
# rdoc-image:assets/reversed_linked_list.gif
# The three pointer approach
def reverse_linked_list(head)
  return head if head.nil?
  curr = head
  nexts = nil
  prevs = nil
  while curr
    nexts = curr.next
    curr.next = prevs
    prevs = curr
    curr = nexts
  end
  prevs
end

#  The two pointer approach
def reverse_linked_list_alternative(head)
  rev = nil
  curr = head
  while curr
    # rev, rev.next, curr = curr, rev, curr.next # Very clever, but hard to understand.
    # We just need to make sure curr.next is updated before curr
    # rev, curr.next, curr = curr, rev, curr.next # works
    curr.next, rev, curr = rev, curr, curr.next # works
    # curr, rev, curr.next = curr.next, curr, rev # doesn't work
  end
  rev
end


node1 = ListNode.new(1)
node2 = ListNode.new(2)
node3 = ListNode.new(3)
node4 = ListNode.new(4)
node5 = ListNode.new(5)
node6 = ListNode.new(6)
node7 = ListNode.new(7)
node8 = ListNode.new(8)
node9 = ListNode.new(9)

node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5
node5.next = node6
node6.next = node7
node7.next = node8
node8.next = node9

# puts reverse_linked_list(node1)
a = reverse_linked_list_alternative(node1)
puts a
