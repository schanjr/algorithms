# frozen_string_literal: true
# AVL Tree rotation examples
# rubocop:disable Layout/CommentIndentation
class Node
  attr_accessor :left, :right, :val, :height

  def initialize(val)
    @left = @right = nil
    @val = val
    @height = 1
  end
end

class AVLTree
  attr_reader :root

  # Time Complexity:
  # The rotation operations (left and right rotate) take constant time as only a few pointers are being changed there.
  # Updating the height and getting the balance factor also takes constant time.
  # So the time complexity of AVL insert remains same as BST insert which is O(h) where h is the height of the tree.
  # Since AVL tree is balanced, the height is O(Logn). So time complexity of AVL insert is O(Logn).
  #
  # Comparison with Red Black Tree:
  # The AVL tree and other self-balancing search trees like Red Black are useful to get all basic operations done
  # in O(log n) time. The AVL trees are more balanced compared to Red-Black Trees, but they may cause more rotations
  # during insertion and deletion. So if your application involves many frequent insertions and deletions, then
  # Red Black trees should be preferred. And if the insertions and deletions are less frequent and search is
  # the more frequent operation, then AVL tree should be preferred over Red Black Tree.

  def insert(val, node = @root)
    # Step 1 - Perform normal BST
    if node.nil?
      return Node.new(val)
    elsif val < node.val
      node.left = insert(val, node.left)
    else
      node.right = insert(val, node.right)
    end

    # Step 2 - Update the height of the
    # ancestor node
    node.height = 1 + [get_height(node.left), get_height(node.right)].max
    # Step 3 - Get the balance factor
    balance = get_balance(node)

    # Step 4 - If the node is unbalanced,
    # then try out the 4 cases
    # Case 1 - Left Left
    return right_rotate(node) if balance > 1 && val < node.left.val
    # Case 2 - Right Right
    return left_rotate(node) if balance < -1 && val > node.right.val

    # Case 3 - Left Right
    if balance > 1 && val > node.left.val
      node.left = left_rotate(node.left)
      return right_rotate(node)
    end

    # Case 4 - Right Left
    if balance < -1 && val < node.right.val
      node.right = right_rotate(node.right)
      return left_rotate(node)
    end

    node
  end

  #    z                               y
  #  /  \                            /   \
  # T1   y     Left Rotate(z)       z      x
  #     /  \   - - - - - - - ->    / \    / \
  #   T2   x                     T1  T2 T3  T4
  #       / \
  #     T3  T4

  # or in summary
  #    z                               y
  #     \                            /
  #      y     Left Rotate(z)       z
  #     /      - - - - - - - ->      \
  #   T2                             T2
  def left_rotate(z)
    y = z.right
    t2 = y.left

    # perform rotation
    y.left = z
    z.right = t2

    # Update heights
    z.height = 1 + [get_height(z.left), get_height(z.right)].max
    y.height = 1 + [get_height(y.left), get_height(y.right)].max

    # return the new root
    y
  end

  #      T1, T2, T3 and T4 are subtrees.
  #        z                                      y
  #       / \                                   /   \
  #      y   T4      Right Rotate (z)          x      z
  #     / \          - - - - - - - - ->      /  \    /  \
  #    x   T3                               T1  T2  T3  T4
  #   / \
  # T1   T2

  # or in summary
  #        z                                      y
  #       /                                         \
  #      y           Right Rotate (z)                z
  #       \          - - - - - - - - ->             /
  #        T3                                     T3

  def right_rotate(z)
    y = z.left
    t3 = y.right

    # perform rotation
    y.right = z
    z.left = t3

    # Update heights
    z.height = 1 + [get_height(z.left), get_height(z.right)].max
    y.height = 1 + [get_height(y.left), get_height(y.right)].max

    # return the new root
    y
  end

  # Other examples
  # Left rotate, right rotate
  #      z                               z                           x
  #     / \                            /   \                        /  \
  #    y   T4  Left Rotate (y)        x    T4  Right Rotate(z)    y      z
  #   / \      - - - - - - - - ->    /  \      - - - - - - - ->  / \    / \
  # T1   x                          y    T3                    T1  T2 T3  T4
  #     / \                        / \
  #   T2   T3                    T1   T2

  # Right rotate, left rotate
  #    z                            z                            x
  #   / \                          / \                          /  \
  # T1   y   Right Rotate (y)    T1   x      Left Rotate(z)   z      y
  #     / \  - - - - - - - - ->     /  \   - - - - - - - ->  / \    / \
  #    x   T4                      T2   y                  T1  T2  T3  T4
  #   / \                              /  \
  #  T2   T3                          T3   T4

  def get_height(node = @root)
    return 0 if node.nil?

    node.height
  end

  def get_balance(node = @root)
    return 0 if node.nil?

    get_height(node.left) - get_height(node.right)
  end

  def pre_order(node = @root)
    return if node.nil?

    puts "#{node.val} "
    pre_order(node.left)
    pre_order(node.right)
  end

  def get_min_value_node(node)
    return node if node.nil? || node.left.nil?

    get_min_value_node(node.left)
  end


  # Time Complexity: The rotation operations (left and right rotate) take constant time as only few pointers are being changed there.
  # Updating the height and getting the balance factor also take constant time.
  # So the time complexity of AVL delete remains same as BST delete which is O(h) where h is height of the tree.
  # Since AVL tree is balanced, the height is O(Logn). So time complexity of AVL delete is O(Log n).
  def delete(value, node = @root)
    # Step 1 - Perform standard BST delete
    return node if node.nil?

    if value < node.val
      node.left = delete(value, node.left)

    elsif value > node.val
      node.right = delete(value, node.right)

    else
      if node.left.nil?
        temp = node.right
        node = nil
        return temp

      elsif node.right.nil?
        temp = node.left
        node = nil
        return temp
      end

      temp = get_min_value_node(node.right)
      node.val = temp.val
      node.right = delete(temp.val, node.right)

      # If the tree has only one node,
      # simply return it
      return node if node.nil?

      # Step 2 - Update the height of the
      # ancestor node
      node.height = 1 + max(get_height(node.left), get_height(node.right))

      # Step 3 - Get the balance factor
      balance = get_balance(node)

      # Step 4 - If the node is unbalanced,
      # then try out the 4 cases
      # Case 1 - Left Left
      if balance > 1 && get_balance(node.left) >= 0
        return right_rotate(node)
      end

      # Case 2 - Right Right
      if balance < -1 && get_balance(node.right) <= 0
        return left_rotate(node)
      end

      # Case 3 - Left Right
      if balance > 1 && get_balance(node.left) < 0
        node.left = left_rotate(node.left)
        return right_rotate(node)
      end

      # Case 4 - Right Left
      if balance < -1 && get_balance(node.right) > 0
        node.right = right_rotate(node.right)
        return left_rotate(node)
      end
    end
    node
  end

end

# Driver program to test above function
avl = AVLTree.new

root = avl.insert(10)
root = avl.insert(20, root)
root = avl.insert(30, root)
root = avl.insert(40, root)
root = avl.insert(50, root)
root = avl.insert(25, root)

# The constructed AVL Tree would be
#             30
#            /  \
#          20   40
#         /  \     \
#        10  25    50

# Preorder Traversal
avl.pre_order(root)

# rubocop:enable Layout/CommentIndentation

puts "Deleting 10"
avl.delete(10, root)

avl.pre_order(root)

