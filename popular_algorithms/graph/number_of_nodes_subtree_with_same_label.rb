# https://leetcode.com/problems/number-of-nodes-in-the-sub-tree-with-the-same-label/

def count_sub_trees(n, edges, labels)
  labels = labels.each_char.map { _1.ord - 97 }  # TLE w/o this line
  nodes = {}
  edges.each do |(a, b)|
    nodes[a] ||= []
    nodes[a] << b
    nodes[b] ||= []
    nodes[b] << a
  end
  output = [nil] * n
  dfs(0, nil, nodes, labels, output)
  output
end

def dfs(node, parent_node, nodes, labels, output)
  label_counters = Hash.new(0)
  label_counters[labels[node]] += 1
  nodes[node].each do |n|
    next if n == parent_node
    child_counters = dfs(n, node, nodes, labels, output)
    child_counters.each do |label, counter|
      label_counters[label] += counter
    end
  end
  output[node] = label_counters[labels[node]]
  label_counters
end