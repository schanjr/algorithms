class Node
  attr_accessor :left, :right, :data

  def initialize data
    @left = @right = nil
    @data = data
  end
end

class BST
  attr_accessor :get_depth_count

  def initialize
    @get_depth_count = 0
  end

  def levelOrder(root)
    #Write your code here
  end

  def max_height(data)
    # Base case for the recursion to exit. May become slightly different if root=nil.
    if data.nil?
      return -1
    else
      1 + [max_height(data.left), max_height(data.right)].max
    end
  end

  def min_height(data)
    return 0 unless data
    return 1 unless data.left && data.right
    1 + [min_height(data.left), min_height(data.right)].min
  end

  def get_depth(data, node_value, level=0)
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

  def get_level_order(root)
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
    return string
  end

end


tree = BST.new
root = Node.new(5)
root.left = Node.new(4)
root.right = Node.new(6)
root.left.left = Node.new(3)
root.left.right = Node.new(7)
root.right.left = Node.new(2)
root.right.right = Node.new(10)


puts tree.max_height(root)
puts tree.get_depth(root, 4)
puts tree.get_level_order(root)

