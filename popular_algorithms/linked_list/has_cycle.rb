require_relative './list_node'

# https://leetcode.com/explore/featured/card/top-interview-questions-easy/93/linked-list/773/
# rdoc-image:assets/has_cycle.png
def has_cycle_destructive_method(head)
  tmp = nil
  node = head
  while node&.next do
    tmp, node = node, node.next
    tmp.next = false
    return true if node.next == false
  end
  false
end

# [Tortoise and Hare method](https://en.wikipedia.org/wiki/Cycle_detection#Tortoise_and_hare)
def has_cycle(head)
  slow = head
  fast = head.next
  while slow != fast
    slow = slow.next
    fast = fast.next.next
  end
  true
rescue => e
  false
end

n1 = ListNode.new(1)
n2 = ListNode.new(2)
n3 = ListNode.new(3)
n4 = ListNode.new(4)
n5 = ListNode.new(5)

# has cycle
n1.next, n2.next, n3.next = n2, n3, n1
puts has_cycle(n1)

# no cycle
n1.next, n2.next, n3.next = n2, n3, nil
puts has_cycle(n1)

# no cycle
n1.next = nil
puts has_cycle(n1)
