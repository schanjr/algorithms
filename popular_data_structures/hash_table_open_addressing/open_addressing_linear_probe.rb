require_relative 'node'

# Might not follow the exact rules of Open Addressing because we
# resize due to load factor. This is to avoid probing too often.

class OpenAddressingLinearProbe
  def initialize(size)
    @max_load_factor = 0.7
    @items = Array.new(size)
  end

  def []=(key, value)
    insert_item_to_any_array(@items, key, value)
    self.resize if load_factor > @max_load_factor
  end

  def insert_item_to_any_array(array, key, value)
    new_node = Node.new(key, value)
    i = index(key, array.size)
    if array[i].nil? || array[i].deleted?
      array[i] = new_node
    elsif array[i].key == key
      # Key is the same, but value is replaced.
      array[i] = new_node
    elsif array[i].key != key
      find_next_index = linear_probe(array, i)
      if find_next_index > -1
        array[find_next_index] = value
      else
        self.resize
        self.[]=(key, value)
      end
    else
      puts 'Got into impossible scenario. Something broke.'
    end
  end

  def [](key)
    i = index(key, self.size)
    if @items[i].key == key
      return @items[i].value
    end
  end

  def linear_probe(array, index)
    # Returns next available index of empty or deleted node
    # Does not check for available index back to the beginning.
    size = array.size
    while index <= size
      node = array[index]
      return index if node.nil? || node.deleted?
      index += 1
    end
    # Reached the end of the probe. Must resize.
    return -1
  end

  def index(key, size)
    key.sum % size
  end

  def size
    @items.size
  end

  def resize
    new_size = size * 2
    new_arr = Array.new(new_size)
    @items.reject { |item| item.deleted? == true || item.nil? }
    @items.each do |item|
      insert_item_to_any_array(new_arr, item.key, item.value)
    end
    @items = new_arr
  end


  def load_factor
    x = 0.0
    for i in 0..self.size - 1
      if !@items[i].nil?
        x += @items[i].size
      end
    end
    x / self.size
  end

  def print_hash
    (0...size()).each do |i|
      if @items[i] != nil
        puts "index: #{i}, #{@items[i].key}: #{@items[i].value}"
      end
    end
    puts "load factor: #{load_factor()}"
  end
end
