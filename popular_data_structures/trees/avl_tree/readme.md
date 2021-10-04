## AVL - Adelson-Velsky and Landis A self balancing Binary Search Tree
- https://www.youtube.com/watch?v=_8qqlVH5NC0
- https://www.geeksforgeeks.org/avl-tree-set-1-insertion/
- https://www.geeksforgeeks.org/red-black-tree-set-1-introduction-2/
- https://www.geeksforgeeks.org/red-black-tree-vs-avl-tree/

### Time Complexity Insertion

The rotation operations (left and right rotate) take constant time as only a few pointers are being changed there.
Updating the height and getting the balance factor also takes constant time. So the time complexity of AVL insert
remains same as BST insert which is O(h) where h is the height of the tree. Since AVL tree is balanced, the height is O(
Logn). So time complexity of AVL insert is O(Logn).

### Time Complexity Deletion

The rotation operations (left and right rotate) take constant time as only few pointers are being changed there.
Updating the height and getting the balance factor also take constant time. So the time complexity of AVL delete remains
same as BST delete which is O(h) where h is height of the tree. Since AVL tree is balanced, the height is O(Logn). So
time complexity of AVL delete is O(Log n).

### Comparison with Red Black Tree

The AVL tree and other self-balancing search trees like Red Black are useful to get all basic operations done in O(log
n) time. The AVL trees are more balanced compared to Red-Black Trees, but they may cause more rotations during insertion
and deletion. So if your application involves many frequent insertions and deletions, then Red Black trees should be
preferred. And if the insertions and deletions are less frequent and search is the more frequent operation, then AVL
tree should be preferred over Red Black Tree.

## Difference:
- AVL trees provide faster lookups than Red Black Trees because they are more strictly balanced.
- Red Black Trees provide faster insertion and removal operations than AVL trees as fewer rotations are done due to relatively relaxed balancing.
- AVL trees store balance factors or heights with each node, thus requires storage for an integer per node whereas Red Black Tree requires only 1 bit of information per node.
- Red Black Trees are used in most of the language libraries like map, multimap, multiset in C++ whereas AVL trees are used in databases where faster retrievals are required.
