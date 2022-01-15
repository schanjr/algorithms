class ListNode
  attr_accessor :val, :next

  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

def is_palindrome(head, match = true)
  curr_node = head
  while match && !curr_node.next.nil?
    tail_val, prev_node = last_node(curr_node)
    if tail_val == curr_node.val
      curr_node = curr_node.next
      prev_node.next = nil
    else
      match = false
    end
  end
  match
end

def last_node(head)
  prev_node = curr_node = head
  until curr_node.next.nil?
    prev_node = curr_node
    curr_node = curr_node.next
  end
  [curr_node.val, prev_node]
end

node5 = ListNode.new(5)
node4 = ListNode.new(5, node5)
node3 = ListNode.new(3, node4)
node2 = ListNode.new(5, node3)
head = ListNode.new(1, node2)

# node6 = ListNode.new(7)
# node7 = ListNode.new(4, node6)
# node8 = ListNode.new(2, node7)
# node9 = ListNode.new(2, node8)
# head2 = ListNode.new(1, node9)

puts is_palindrome(head)