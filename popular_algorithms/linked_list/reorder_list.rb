# [leetcode](https://leetcode.com/problems/reorder-list/)
# 1. Find the midpoint. If midpoint is odd number, choose the floor
# 2. Using the midpoint, reverse everything from there.
# 3. From head, begin merging the original list and the reversed list.
def reorder_list(head)
  slow = fast = head
  while fast && fast.next
    slow = slow.next
    fast = fast.next.next
  end

  curr, rev = slow, nil
  while curr
    curr.next, rev, curr = rev, curr, curr.next
  end

  curr = head
  while rev && rev.next
    next_curr = curr.next
    next_rev = rev.next
    curr.next = rev
    rev.next = next_curr
    curr = next_curr
    rev = next_rev
  end

  head
end
