require_relative '../hash_table_separate_chaining/node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @head = nil
    @tail = nil
    @length = 0
  end

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(new_n)
    if @head.nil?
      @head = new_n
      @tail = new_n
    else
      @tail.next = new_n
      @tail = new_n
    end
    @length += 1
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    if @head === @tail
      @head = nil
      @tail = nil
    else
      new_n = @head
      while ((!new_n.nil?) && (new_n.next != @tail)) do
        new_n = new_n.next
      end
      @tail = new_n
      @tail.next = nil
    end
    @length -= 1
  end

  # This method prints out a representation of the list.
  def print(hash)
    new_n = @head
    i = 0
    while !new_n.nil?
      puts "Hash: #{hash} -> Position: #{i} -> Key: #{new_n.key} -> Value: #{new_n.value}"
      new_n = new_n.next
      i += 1
    end
  end

  def delete(new_n)
    if !@head.nil? # O(1)
      if @head === new_n
        remove_front
      elsif @tail === new_n # O(1)
        remove_tail
      else # The infamous separate chaining O(N)
        current_node = @head
        while !current_node.nil? && current_node.next.key != new_n.key
          current_node = current_node.next
        end
        if !current_node.next.next.nil?
          next_next_node = current_node.next.next
          current_node.next = next_next_node
        else
          puts 'something probably went wrong'
        end
      end
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(new_n)
    new_n.next = @head
    @head = new_n

    if @tail.nil?
      @tail = new_n
    end
    @length += 1
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    if @head.nil?
      puts "Bro, there is nothing to remove"
      return
    end
    new_n = @head
    if @head === @tail
      @head = nil
      @tail = nil
    elsif !@head.nil?
      @head = new_n.next
      if @head.next.nil?
        @tail = @head
      end
    end
    @length -= 1
    new_n
  end

  def find_node(key)
    c_n = @head
    while !c_n.nil? && c_n.key != key
      c_n = c_n.next
    end
    c_n
  end

  def size
    @length
  end
end
