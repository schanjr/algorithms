## Queue
The basis of Stacks is the FIFO concept where items pushed first into a store are also the first to come out. 

## Implementations

### LinkedList
Enqueuing into the linked list can be implemented by appending to the back of the singly-linked list, which takes worst-case time O(1). Dequeuing can be implemented by removing the first element, which also takes worst-case time O(1). This also requires a new allocation per enqueue, which may be slow.

### Circular Buffer
Enqueuing into the circular buffer works by inserting something at the next free position in the [circular buffer]. This works by growing the array if necessary, then inserting the new element. Using a similar analysis for the dynamic array, this takes best-case time O(1), worst-case time O(n), and amortized time O(1). Dequeuing from the buffer works by removing the first element of the circular buffer, which takes time O(1) in the worst case.

## Use cases


![Queue](./assets/fifo.png)
Credits to wikipedia

[circular buffer]: <https://www.youtube.com/watch?v=ia__kyuwGag>
