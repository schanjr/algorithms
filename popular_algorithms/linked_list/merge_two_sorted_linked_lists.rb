# https://leetcode.com/problems/merge-two-sorted-lists/description/?envType=study-plan&id=level-1

require_relative './list_node'

def merge_two_sorted_linked_lists(l1,l2)
  return l1 unless l2
  return l2 unless l1
  if l1.val < l2.val
    l1.next = merge_two_sorted_linked_lists(l1.next, l2)
    return l1
  else
    l2.next = merge_two_sorted_linked_lists(l1, l2.next)
    return l2
  end
end

l1 = ListNode.new(1, ListNode.new(2, ListNode.new(7)))
l2 = ListNode.new(3, ListNode.new(4, ListNode.new(10)))
merged = merge_two_sorted_linked_lists(l1, l2)
memo = []
while merged
  memo << merged.val
  merged = merged.next
end
puts memo.to_s