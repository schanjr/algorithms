require_relative 'node'
require_relative 'probe_techniques'

# Might not follow the exact rules of Open Addressing because we
# resize due to load factor. This is to avoid probing too often.
class OpenAddressing
  attr_reader :probe_formula

  include HashTableProbes

  def initialize(size)
    @max_load_factor = 0.7
    @items = Array.new(size)
    @size = size
    @probe_formula = "double_hashing" # linear, quadratic, double_hashing
  end

  def probe_formula(formula)
    raise 'no formulas found' unless FIXED_PROBE_FORMULAS
    unless FIXED_PROBE_FORMULAS.include?(formula)
      raise "available formulas: #{FIXED_PROBE_FORMULAS}, given: #{formula}"
    end
    @probe_formula = formula
  end

  def []=(key, value)
    insert_item_to_any_array(@items, key, value)
    self.resize if load_factor > @max_load_factor
  end

  def delete(key)
    i = index(key, self.size)
    node = @items[i]
    unless node.nil?
      if node.key == key
        return node.delete = true
      end
    end
    # Collision handling scenario...
    node = self.send("#{@probe_formula}_find".to_sym, key)
    return node.delete = true unless node.nil?
    # Can't delete anything
    false
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
      find_next_index = probe(array, i, key)
      array[find_next_index] = new_node
      if find_next_index == -1
        self.resize
        self.insert_item_to_any_array(@items, key, value)
      else
        array[find_next_index] = new_node
      end
    else
      puts 'Got into impossible scenario. Something broke.'
    end
  end

  def [](key)
    i = index(key, self.size)
    node = @items[i]
    unless node.nil?
      if node.key == key
        return node.value
      end
    end
    # Collision handling scenario...
    node = self.send("#{@probe_formula}_find".to_sym, key)
    return node.value unless node.nil?
    nil
  end

  def probe(array, index, key)
    self.send("#{@probe_formula}_probe".to_sym, array, index, key)
  end

  def index(key, size)
    key.sum % size
  end

  def size
    @size
  end

  def resize
    puts "######################## RESIZING ##############################"
    new_size = size * 2
    new_arr = Array.new(new_size)
    cleaned_items = @items.compact.reject { |item| item.deleted? == true }
    cleaned_items.each do |item|
      insert_item_to_any_array(new_arr, item.key, item.value)
    end
    puts "######################## RESIZING Complete ##############################"
    @items = new_arr
    @size = new_size
  end


  def load_factor
    x = 0.0
    @items.compact.each do |node|
      unless node.deleted?
        x += 1
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
    puts "load factor: #{load_factor}"
  end
end
