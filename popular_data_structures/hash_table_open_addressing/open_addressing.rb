require_relative 'node'

# Might not follow the exact rules of Open Addressing because we
# resize due to load factor. This is to avoid probing too often.

class OpenAddressingLinearProbe
  def initialize(size)
    @max_load_factor = 0.7
    @items = Array.new(size)
    @size = size
  end

  def []=(key, value)
    new_node = Node.new(key, value)
    i = index(key, size)

    if @items[i].nil?
      @items[i] = new_node
    elsif @items[i].key != key
      self.resize
      self[key] = value
    elsif (@items[i].key == key) && (@items[i].value != value)
      if self.next_open_index(@items[i]) === -1
        self.resize
        @items[i] = value
      elsif self.next_open_index(@items[i]) != -1
        @items[i] = value
      end
    end

    self.resize if load_factor > @max_load_factor
  end

  def [](key)
    i = index(key, size)
    if @items[i].key == key
      return @items[i].value
    end
  end

  def linear_probe(index)
    while index <= size
      node = @items[index]
      return index if node.nil? && node.deleted != true
      index += 1
    end
    # Reached the end of the probe. Must resize.
    return -1
  end

  def index(key, size)
    key.sum % size
  end

  def next_open_index(index)
    @items.each do |ele|
      if ele.nil?
        return index
      else
        return -1
      end
    end
  end

  def size
    @size
  end

  def resize
    arr = Array.new(size * 2)
    iter = 0..@items.length
    iter.each do |ele|
      if @items[ele]
        inew = @items[ele].key.sum % arr.length
        arr[inew] = @items[ele]
      end
    end
    @items = arr
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
