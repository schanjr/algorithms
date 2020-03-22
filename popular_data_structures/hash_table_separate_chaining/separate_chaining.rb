require_relative 'node'
require_relative 'linked_list'

# A majority of the code is taken from https://github.com/mdjaved1/Sep_dec
# though there are bugs in its original implementation, I tried to make sure it works.

# There is still a weird bug where data is lost everytime we create large entries...

class SeparateChaining
  attr_reader :max_load_factor
  attr_accessor :items, :size

  def initialize(size)
    @max_load_factor = 0.7
    @items = Array.new(size)
    @size = @items.size
  end

  def []=(key, value)
    new_n = Node.new(key, value)
    i = index(key, @size)
    in_list = @items[i]
    if in_list.nil?
      list = LinkedList.new
      list.add_to_tail(new_n)
      @items[i] = list
    elsif in_list
      node = @items[i].find_node(key)
      @items[i].delete(node) if node
      @items[i].add_to_tail(new_n)
    end

    self.resize if load_factor > @max_load_factor
  end

  def [](key)
    i = index(key, @size)
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
  def index(key, input_size)
    index_modulus_method(key, input_size)
    # index_division_method(key, input_size)
    # index_division_method2(key, input_size)
  end

  def index_multiplication_method(key, input_size)

  end

  # Introduction to Algorithms 3rd Edition - Cormen, Leiserson, Rivest, Stein
  # 11.3
  def index_division_method(key, input_size)
    return 3 if input_size <= 3
    key_sum = key.sum
    collision_threshold = input_size / 3
    prime_number = find_closest_prime(collision_threshold)
    index = key_sum % prime_number
    index
  end

  def index_division_method2(key, input_size)
    # Formula = h(k) = (2k + 3) % size
    key_sum = key.sum
    h_k = (key_sum * 2) + 3
    h_k % input_size
  end

  def find_closest_prime(num)
    until is_prime(num)
      num -= 1
    end
    num
  end

  def is_prime(n)
    return false if n <= 1
    return true if n <= 3
    return false if ((n % 2) == 0) || ((n % 3) == 0)
    i = 5
    while i * i <= n
      return false if n % i == 0 || n % (i + 2) == 0
      i += 6
    end
    return true
  end

  def index_modulus_method(key, size)
    key.sum % size
  end

  # Calculate the current load factor
  # Total values stored/ Total Bags created
  def load_factor
    x = 0.0
    for i in 0..self.size - 1
      if !@items[i].nil?
        x += @items[i].size
      end
    end
    x / self.size
  end

  # Simple method to return the number of items in the hash
  def size
    @size
  end

  # Resize the hash
  def resize
    puts "-----------------------------RESIZE----------------------------------------"
    new_size = size * 2
    old_l = @items.compact
    new_l = Array.new(new_size)
    old_l.each do |list|
      while list.size > 0
        new_n = list.remove_front
        modify_hash(new_l, new_size, new_n.key, new_n.value)
      end
    end
    puts "-----------------------------RESIZE COMPLETE----------------------------------------"
    @items = new_l
    @size = new_size
  end

  def modify_hash(list, input_size, key, value)
    i = index(key, input_size)
    new_n = Node.new(key, value)
    in_list = list.slice(i)
    if in_list
      node = in_list.find_node(key)
      in_list.delete(node) if node
      in_list.add_to_tail(new_n)
    else
      ll = LinkedList.new
      ll.add_to_tail(new_n)
      list[i] = ll
    end
  end

  def print
    for i in 0..self.size - 1
      if !@items[i].nil?
        @items[i].print(i)
      end
    end
  end
end
