# https://leetcode.com/problems/longest-path-with-different-adjacent-characters/
# Solution summary:

def longest_path(parent, s)
  @maximum = 1
  @letters = s.bytes
  @tree = build_tree(parent)
  count_long_path(0, 0)
  @maximum
end

def count_long_path(node_index, char)
  child_nodes = @tree[node_index]
  paths = child_nodes.map { |child_index| count_long_path(child_index, @letters[node_index]) }.max(2)
  local_maximum = 1 + paths.sum
  @maximum = local_maximum if local_maximum > @maximum
  return 0 if @letters[node_index] == char

  1 + paths.max.to_i
end

def build_tree(list)
  tree = { -1 => [] }
  list.each.with_index do |parent, index|
    if tree.key?(parent)
      tree[parent] << index
    else
      tree[parent] = [index]
    end
    tree[index] ||= []
  end
  tree
end

parent = [-1,0,0,1,1,2]
s = "abacbe"

puts longest_path(parent, s)