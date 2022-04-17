class Node
  attr_accessor :left, :right, :data

  def initialize(data)
    @left = @right = nil
    @data = data
  end
end

class Tree
  attr_reader :root

  def populate_as_bst(nums)
    if nums.nil? || nums.empty?
      return nil
    end
    median = (nums.size / 2).floor
    m_node = Node.new(nums[median])
    m_node.left = populate_as_bst(nums.slice(0, median))
    m_node.right = populate_as_bst(nums.slice(median + 1, nums.size))
    return m_node
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

  def get_depth(node_value, data = @root, level = 0)
    # The count of number of vertices from Root to the specific node. This algorithm identify the Node using the value.

    # Base case to exit if there are no more values
    return 0 if (data.nil?)
    return level if (data.data == node_value)

    downlevel = get_depth(node_value, data.left, level + 1)
    return downlevel if (downlevel != 0)

    downlevel = get_depth(node_value, data.right, level + 1)

    downlevel
  end

  # Breadth definition is - distance from side to side : width.
  # Also known as Breadth First Search(BFS) algorithm. You start with Root, then keep iterating over child nodes.
  def level_order_queue(root = @root)
    # Add the root into the queue to get things started
    # 1. Remove the first item of the queue an push the data to the accumulating string.
    # 2. Check if the current node has vertices, if there are any, put them into the queue
    # Repeat step 1 and 2 until queue is empty
    string = ''
    queue = []
    queue.push(root) if !root.nil?
    until queue.empty?
      node = queue.shift
      string += node.data.to_s + ' '
      queue.push(node.left) if node.left
      queue.push(node.right) if node.right
    end
    string
  end

  # This is similar to BFS class of algorithms.
  def level_order_hash
    current_level = 0
    current_node = @root
    data = {}
    data[current_level] = [current_node]
    until data[current_level].nil?
      data[current_level].each do |node|
        left_right = [node.left, node.right].compact
        next if left_right.empty?

        data[current_level + 1] ||= []
        data[current_level + 1] += left_right
      end
      current_level += 1
    end
    data
  end

  def display
    puts "Displaying Level Order"
    data = level_order_hash
    data.each_with_index do |val, index|
      puts "Level #{index}: #{data[index].map(&:data)}"
    end
  end

  # Depth First Type Traversal
  # If tree is Binary Search Tree (sorted) then it this will print smallest to biggest
  def in_order_traversal(root = @root, memo = [])
    unless root.nil?
      in_order_traversal(root.left, memo)
      memo.push(root.data)
      in_order_traversal(root.right, memo)
    end
    memo
  end

  # Depth First Type Traversal
  # This is mentioned on many forums for copying the tree
  # If you think the value is near the root, use this for traversal
  def pre_order_traversal(root = @root, memo = [])
    unless root.nil?
      memo.push(root.data)
      pre_order_traversal(root.left, memo)
      pre_order_traversal(root.right, memo)
    end
    memo
  end

  # Depth First Type Traversal
  # If you think the value is near the leaves of the root, use this for traversal
  def post_order_traversal(root = @root, memo = [])
    unless root.nil?
      post_order_traversal(root.left, memo)
      post_order_traversal(root.right, memo)
      memo.push(root.data)
    end
    memo
  end

  # This is a BST search algorithm
  def search(val, node = @root)
    if node.nil?
      puts "#{val} cannot be found"
      return node
    end
    return node if node.data == val
    return search(val, node.left) if node.data > val
    return search(val, node.right) if node.data < val
  end

  # This is a BST insert algorithm
  # Insertion of a key
  # A new key is always inserted at the leaf.
  # We start searching a key from the root until we hit a leaf node. Once a leaf node is found,
  # the new node is added as a child of the leaf node.
  def insert(val, node = @root)
    return Node.new(val) if node.nil?

    if node.data == val
      puts "BST cannot have duplicates: #{val}"
      return node
    end
    node.left = insert(val, node.left) if node.data > val
    node.right = insert(val, node.right) if node.data < val

    node
  end

  def smallest_value_node(node)
    current = node

    # loop down to find the leftmost leaf
    until current.left.nil?
      current = current.left
    end
    current
  end

  # ref
  # https://www.geeksforgeeks.org/binary-search-tree-set-2-delete/

  # Delete Algo for BST
  # Three possibilities
  # 1) Node to be deleted is the leaf: Simply remove from the tree.
  # 2) Node to be deleted has only one child: Copy the child to the node and delete the child
  # 3) Node to be deleted has two children: Find inorder successor of the node. Copy contents of the inorder successor
  #   to the node and delete the inorder successor. Note that inorder predecessor can also be used.
  #
  # Worst case can be o(H) where H is the height of the tree. If the tree is heavily skewed, worst case is instead o(N)
  #   where N is the number of nodes.
  def delete(val, node = @root)
    # value is not found in tree
    if node.nil?
      return node
    end

    # Keep finding recursively of the position of the node.
    if node.data > val
      node.left = delete(val, node.left)

    elsif node.data < val
      node.right = delete(val, node.right)
      # It reaches here when node.data == val Below are logic for replacement
    else
      # single replacement only one child
      if node.left.nil?
        temp = node.right
        node = nil
        return temp
      elsif node.right.nil?
        temp = node.left
        node = nil
        return temp
      end
      # two children
      temp = smallest_value_node(node.right)
      node.data = temp.data
      node.right = delete(temp.data, node.right)
    end
    node
  end
end
