class ListNode
  attr_accessor :val, :next

  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

def merge_two_lists(l1, l2)
  return l1 if l2.nil?
  return l2 if l1.nil?


  if l1.val <= l2.val
    head, base = l1, l1
    shrink = l2
  else
    head, base = l2, l2
    shrink = l1
  end
  until shrink.nil? do
    if base.val <= shrink.val
      if base.next.nil?
        base.next = shrink
        return head
      elsif base.next.val < shrink.val
        base = base.next
        next
      else
        tmp = base.next
        base.next = shrink
        shrink = shrink.next
        base.next.next = tmp
        next
      end
    end
  end
  head
end

node5 = ListNode.new(5)
node4 = ListNode.new(4, node5)
node3 = ListNode.new(3, node4)
node2 = ListNode.new(2, node3)
head = ListNode.new(1, nil)

node6 = ListNode.new(7)
node7 = ListNode.new(4, node6)
node8 = ListNode.new(2, node7)
node9 = ListNode.new(2, node8)
head2 = ListNode.new(1, nil)

puts merge_two_lists(head, head2)