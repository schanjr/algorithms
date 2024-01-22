class ListNode
  attr_accessor :key, :value, :prev, :next

  def initialize(key, value)
    @key = key
    @value = value
    @prev = nil
    @next = nil
  end
end

class LRUCache
  def initialize(capacity)
    @dic = {}  # key to node
    @capacity = capacity
    @head = ListNode.new(0, 0)
    @tail = ListNode.new(-1, -1)
    @head.next = @tail
    @tail.prev = @head
  end

  def get(key)
    if @dic.key?(key)
      node = @dic[key]
      remove_from_list(node)
      insert_into_head(node)
      return node.value
    else
      return -1
    end
  end

  def put(key, value)
    if @dic.key?(key)
      node = @dic[key]
      remove_from_list(node)
      insert_into_head(node)
      node.value = value
    else
      if @dic.size >= @capacity
        remove_from_tail
      end
      node = ListNode.new(key, value)
      @dic[key] = node
      insert_into_head(node)
    end
  end

  def remove_from_list(node)
    node.prev.next = node.next
    node.next.prev = node.prev
  end

  def insert_into_head(node)
    head_next = @head.next
    @head.next = node
    node.prev = @head
    node.next = head_next
    head_next.prev = node
  end

  def remove_from_tail
    return if @dic.empty?
    tail_node = @tail.prev
    @dic.delete(tail_node.key)
    remove_from_list(tail_node)
  end
end