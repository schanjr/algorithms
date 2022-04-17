require_relative 'tree'

# ar = [*1..8].shuffle
ar = [1, 2, 3, 6, 7, 8]
tree = Tree.new
tree.populate_as_bst(ar.sort)
tree.display
puts "The maximum height is #{tree.max_height}"
puts "From root to value of 7 , the depth is... #{tree.get_depth(7)}"

puts "In Order Traversal #{tree.in_order_traversal.to_s}"
puts "Pre Order Traversal #{tree.pre_order_traversal.to_s}"
puts "Post Order Traversal #{tree.post_order_traversal.to_s}"

puts "Copying Tree..."
tree2 = Tree.new
tree2.populate_as_bst(tree.pre_order_traversal)

puts "Tree 1 and Tree 2 should be identical via copying pre_order_traversal Algo"
puts "Tree 1: #{tree.level_order_queue}"
puts "Tree 2: #{tree.level_order_queue}"

puts "*" * 20
puts tree.search(7).data
tree.insert(20)
tree.display
tree.insert(20)
tree.insert(15)
tree.insert(16)
tree.insert(23)
tree.insert(21)
tree.insert(14)
tree.insert(13)
tree.insert(17)
tree.insert(30)
tree.insert(35)
tree.insert(24)

tree.display

puts "*" * 20
puts "Deleting 20"
tree.delete(20)
tree.display
