## SkipList
_When there is a need of using Binary Search Trees, prefer skip list._ 


## Time Complexity Analysis
What is the time complexity with two layers? The worst case time complexity is number of nodes on “express lane” plus number of nodes in a segment (A segment is number of “normal lane” nodes between two “express lane” nodes) of “normal lane”. So if we have n nodes on “normal lane”, √n (square root of n) nodes on “express lane” and we equally divide the “normal lane”, then there will be √n nodes in every segment of “normal lane” . √n is actually optimal division with two layers. With this arrangement, the number of nodes traversed for a search will be O(√n). Therefore, with O(√n) extra space, we are able to reduce the time complexity to O(√n).

## Can we do better?
   The time complexity of skip lists can be reduced further by adding more layers. In fact, the time complexity of search, insert and delete can become O(Logn) in average case with √n extra space.

## Use Cases
- SkipList is great for multi threaded environments where the value can be 
accessed without being blocked.
- Inserts can be done dynamically without re-referencing multiples nodes such as the downside when balancing trees on tree related data structures. 
- Skiplist by default is sorted. 

![Skip List Animation](./assets/skip_list_animation.gif)
