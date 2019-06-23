class Node

  attr_accessor :data, :next

  def initialize data
    @data = data
    @next = nil
  end
end

class Solution

  def removeDuplicates(head)
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

  def insert(head, value)
    p = Node.new(value)
    if head == nil
      head = p
    elsif head.next == nil
      head.next = p
    else
      current = head
      while current.next != nil
        current = current.next
      end
      current.next = p
    end
    return head
  end

  def display(head)
    current = head
    while current
      print current.data, " "
      current = current.next
    end
  end
end

mylist = Solution.new
head = nil
[1,2,2,3,3,4].each do |data|
  head = mylist.insert(head, data)
end
head = mylist.removeDuplicates(head)
mylist.display(head)




