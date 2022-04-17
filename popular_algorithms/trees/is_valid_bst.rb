# https://leetcode.com/explore/featured/card/top-interview-questions-easy/94/trees/625/

def is_valid_bst(root, less_than = Float::INFINITY, larger_than = (-Float::INFINITY))
  unless root
    return true
  end

  if root.val <= larger_than or root.val >= less_than
    return false
  end

  is_valid_bst(root.left, [less_than, root.val].min, larger_than) \
    && is_valid_bst(root.right, less_than, [larger_than, root.val].max)
end

def is_valid_bst_alternative(node, min = -2 ** 31, max = 2 ** 31 - 1)
  node.nil? ||
    (min..max).include?(node.val) &&
      is_valid_bst(node.left, min, node.val - 1) &&
      is_valid_bst(node.right, node.val + 1, max)
end

## use in-order-traversal techniques for BST. This will print smallest to largest value
