require_relative './list_node'
#https://leetcode.com/explore/featured/card/top-interview-questions-easy/93/linked-list/773/

# rdoc-image:assets/is_palindrome.png
def is_palindrome(head)
  rev = nil
  slow = fast = head
  while fast && fast.next
    fast = fast.next.next
    # rev, rev.next, slow = slow, rev, slow.next # Very clever, but hard to understand.
    # We just need to make sure slow.next is updated before slow
    # rev, slow.next, slow = slow, rev, slow.next # works
    slow.next, rev, slow = rev, slow, slow.next # works
    # slow, rev, slow.next = slow.next, slow, rev # doesn't work
  end
  # handle odd numbered sized array of nodes.
  if fast
    slow = slow.next
  end
  while rev and rev.val == slow.val
    slow = slow.next
    rev = rev.next
  end
  # !nil == true
  # !true == false
  # !false == true
  !rev
end

node1 = ListNode.new(1)
node2 = ListNode.new(2)
node3 = ListNode.new(2)
node4 = ListNode.new(1)
node5 = ListNode.new(1)

# non palindrome
node1.next, node2.next, node3.next, node4.next  = node2, node3, node4, node5
puts is_palindrome(node1)
#palindrome
node1.next, node2.next, node3.next, node4.next  = node2, node3, node4, nil
puts is_palindrome(node1)

node6 = ListNode.new(1, ListNode.new(2))
puts is_palindrome(node6)
