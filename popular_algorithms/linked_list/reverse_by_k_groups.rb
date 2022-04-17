require_relative './list_node'

# Given a linked list, write a function to reverse every k nodes (where k is an input to the function).
# Don't reverse if next group is below k
# @topics companies
#     - bytedance
# @topics algorithms
#     - recursion
#     - two pointers
# - Input: 1->2->3->4->5->6->7->8->NULL, K = 3
# - Output: 3->2->1->6->5->4->8->8->NULL
# - Input: 1->2->3->4->5->6->7->8->NULL, K = 5
# - Output: 5->4->3->2->1->6->7->8->NULL
def reverse_by_k_groups(head, k)
  return head if head.nil?
  return head unless has_k_groups?(head, k)
  count = 0
  current = head
  rev = nil
  while current and count < k
    rev, rev.next, current = current, rev, current.next
    count += 1
  end

  if !current.nil?
    head.next = reverse_by_k_groups(current, k)
  end
  rev
end

def has_k_groups?(head, k)
  1.upto(k).each do
    return false if head.nil?
    head = head.next
  end
  true
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

ans = reverse_by_k_groups(node1, 3)
puts ans
