# binary_tree

Regarding the breadth search, google seems to suggest to commonly use a queue type data structure, utilizing FIFO. 
It seem that you kept on needing to append children from left to right onto the queue.

In being asked to do a smart search, one that is O(log n), I googled what it is meant by it (remembering discussing this a bit at 8th light).
The definition seemed to state that O(log n) is: "I divide the class in two, then ask: "Is it on the left side, or the right side of the classroom?" Then I take that group and divide it into two and ask again, and so on. In the worst case I need to ask log n questions."

Since the data structure given is a binary tree, it seemed natural to use a binary search, which is 0(log n) for the find method.
Given this definition, drawing out the binary tree to give some visual, and seeing how you used recursion in the depth traversal and add method, I saw that there was a natural halving process already inherently involved. 
Meaning one seemed to be able to prune certain branches that would not contain the number being targeted, resulting in ultimately finding the target by following its path along the branch.

