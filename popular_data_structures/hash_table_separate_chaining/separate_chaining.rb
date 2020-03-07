require_relative 'node'
require_relative 'linked_list'

# The code used here is provided by https://github.com/mdjaved1/Sep_dec
# and further enhanced...

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @max_load_factor = 0.7
    @items = Array.new(size)
  end

  def []=(key, value)
    new_n = Node.new(key, value)
    i = index(key, self.size)
    if @items[i].nil?
      list = LinkedList.new
      list.add_to_tail(new_n)
      @items[i] = list
    elsif @items[i]
      node = @items[i].find_node(key)
      @items[i].delete(node) if node
      @items[i].add_to_tail(new_n)
    end

    resize if self.load_factor > @max_load_factor
    if @items[i].size > 4
      resize
      self[key] = value
    end
  end

  def [](key)
    i = index(key, self.size)
    if !@items[i].nil?
      node = @items[i].find_node(key)
      if !node.value.nil?
        return node.value
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Calculate the current load factor
  def load_factor
    x = 0.0
    for i in 0..self.size-1
      if !@items[i].nil?
        x += @items[i].size
      end
    end
    x / self.size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    old_l = @items.compact
    @items = Array.new(self.size * 2)
    old_l.each do |list|
      while list.size > 0
        new_n = list.remove_front
        self[new_n.key] = new_n.value
      end
    end
  end

  def print
    for i in 0..self.size-1
      if !@items[i].nil?
        @items[i].print(i)
      end
    end
  end
end
