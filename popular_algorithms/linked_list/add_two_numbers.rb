require_relative 'list_node'
# Definition for singly-linked list.
# You are given two non-empty linked lists representing two non-negative integers.  Add the two numbers and return the sum as a linked list.
#
# You may assume the two numbers do not contain any leading zero, except the number 0 itself.
# @example
#   Input: l1 = [2,4,3], l2 = [5,6,4]
#   Output: [7,0,8]
#   Explanation: [2,5] + [4,6] + [3,4] + 1 from previous remainder = [7,0,8]

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers_linked_list(l1, l2)
  ans = ListNode.new
  pointer = ans
  carry = sum = 0

  until l1.nil? && l2.nil? do
    sum = carry
    if l1
      sum += l1.val
      l1 = l1.next
    end

    if l2
      sum += l2.val
      l2 = l2.next
    end

    carry = sum / 10
    pointer.next = ListNode.new(sum % 10)
    pointer = pointer.next
  end
  if carry == 1
    pointer.next = ListNode.new(1)
  end
  ans.next
end

node1 = ListNode.new(2)
node2 = ListNode.new(4)
node3 = ListNode.new(3)

node4 = ListNode.new(5)
node5 = ListNode.new(6)
node6 = ListNode.new(4)


node1.next = node2
node2.next = node3

node4.next = node5
node5.next = node6

puts add_two_numbers_linked_list(node1, node4)
