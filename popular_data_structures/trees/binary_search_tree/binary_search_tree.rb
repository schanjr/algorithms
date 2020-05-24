class Node
  attr_accessor :left, :right, :data

  def initialize(data)
    @left = @right = nil
    @data = data
  end
end

class BST
  attr_accessor :get_depth_count
  attr_reader :root

  def initialize
    @get_depth_count = 0
    @level_order = {}
  end

  def populate_from_sorted_array(array)
    tmp = array.sort
    median = get_median_index(tmp)
    @root = Node.new(tmp[get_median_index(tmp)])

    # left nodes
    @root.left = populate_children(tmp.slice(0, (median)))

    # right nodes
    @root.right = populate_children(tmp.slice((median + 1), tmp.size))
  end

  def populate_children(array)
    median = get_median_index(array)
    median_node = Node.new(array[median])
    #left nodes
    left = array.slice(0, (median))
    #right nodes
    right = array.slice((median + 1), array.size)
    if left.size > 1
      median_node.left = self.populate_children(left)
    elsif left.size == 1
      median_node.left = Node.new(left.pop)
    end
    if right.size > 1
      median_node.right = self.populate_children(right)
    elsif right.size == 1
      median_node.right = Node.new(right.pop)
    end
    median_node
  end

  def get_median_index(array)
    return (array.size / 2).ceil
  end

  def max_height(data = @root)
    # Base case for the recursion to exit. May become slightly different if root=nil.
    if data.nil?
      return -1
    else
      1 + [max_height(data.left), max_height(data.right)].max
    end
  end

  def min_height(data = @root)
    return 0 unless data
    return 1 unless data.left && data.right
    1 + [min_height(data.left), min_height(data.right)].min
  end

  def get_depth(data, node_value, level = 0)
    # The count of number of vertices from Root to the specific node. This algorithm that the
    # distinction to identify the Node using its value is distinctive.

    # Base case to exit if there are no more values
    # This algorithm is super trippy.
    return 0 if (data.nil?)
    return level if (data.data == node_value)
    downlevel = get_depth(data.left, node_value, level + 1)
    return downlevel if (downlevel != 0)
    downlevel = get_depth(data.right, node_value, level + 1)
    return downlevel
  end

  def level_order_queue(root=@root)
    # Add the root into the queue to get things started
    # 1. Remove the first item of the queue an push the data to the accumulating string.
    # 2. Check if the current node has vertices, if there are any, put them into the queue
    # Repeat step 1 and 2 until queue is empty
    string = ""
    queue = []
    queue.push(root) if !root.nil?
    until queue.empty?
      node = queue.shift
      string += node.data.to_s + " "
      queue.push(node.left) if node.left
      queue.push(node.right) if node.right
    end
    string
  end

  def display
    level_order_hash if @level_order.empty?
    @level_order.each_with_index do |val, index|
      puts "Level #{index}: #{@level_order[index].map { |e| e.data }}"
    end
  end

  def level_order_hash
    return unless @level_order.empty?

    current_level = 0
    current_node = @root
    @level_order[current_level] = [current_node]
    until @level_order[current_level].nil?
      @level_order[current_level].each do |node|
        left_right = [node.left, node.right].compact
        break if left_right.empty?
        @level_order[current_level + 1] ||= []
        @level_order[current_level + 1] += left_right
      end
      current_level += 1
    end
  end
end

ar = [3, 5, 1, 2, 10, 9, 4, 15, 30, 7, 8]
tree = BST.new
tree.populate_from_sorted_array(ar)
tree.display
puts tree.level_order_queue
