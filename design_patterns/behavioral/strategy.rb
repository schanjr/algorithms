# The Strategy design pattern is a behavioral design pattern that allows objects to change their behavior at runtime by changing their strategy.
# It is often used to encapsulate a family of algorithms, and to provide a clean interface to those algorithms.
#
#   Here's a summary of the Strategy pattern:
#
# The Strategy design pattern allows objects to change their behavior at runtime by changing their strategy.
# It is often used to encapsulate a family of algorithms, and to provide a clean interface to those algorithms.
# The Strategy pattern consists of a strategy interface and concrete strategy classes that implement the behavior for each strategy.
# The strategy interface defines the behavior that can be performed by each strategy, and the concrete strategy classes implement that behavior.
# The context class holds a reference to the current strategy and delegates behavior to the current strategy.
# The context class can change its strategy by setting a new current strategy.
# Here's an example of the Strategy design pattern in Ruby for a simple sorting scenario, with a real-world example to illustrate the concept:
#
# Imagine you are building a simple application that can sort a list of numbers. There are several ways to sort a list of numbers, such as
# bubble sort, quick sort, and merge sort. You want to allow the user to choose the sorting algorithm they want to use.
#
# To implement this feature, you could use the Strategy design pattern to create a Sorter class with an internal strategy that determines its
# behavior. The Sorter class has a sort method that performs the sorting algorithm specified by the current strategy.
#

# The SortingStrategy interface defines the behavior that can be performed by
# each sorting strategy.
class SortingStrategy
  def sort(numbers)
    raise NotImplementedError
  end
end

# The BubbleSortStrategy class represents the bubble sort strategy.
# It implements the behavior for bubble sort.
class BubbleSortStrategy < SortingStrategy
  def sort(numbers)
    puts 'Sorting using bubble sort'
  end
end

# The QuickSortStrategy class represents the quick sort strategy.
# It implements the behavior for quick sort.
class QuickSortStrategy < SortingStrategy
  def sort(numbers)
    puts 'Sorting using quick sort'
  end
end

# The MergeSortStrategy class represents the merge sort strategy.
# It implements the behavior for merge sort.
class MergeSortStrategy < SortingStrategy
  def sort(numbers)
    puts 'Sorting using merge sort'
  end
end

# The Sorter class holds a reference to the current sorting strategy, and
# delegates sorting to the current strategy.
class Sorter
  attr_reader :strategy

  def initialize(strategy)
    @strategy = strategy
  end

  def sort(numbers)
    @strategy.sort(numbers)
  end
end

# The client code can use the Sorter class to sort lists of numbers, and the
# sorter's behavior will change depending on its strategy.
sorter = Sorter.new(BubbleSortStrategy.new)
sorter.sort([5, 3, 8, 1, 2, 4, 7, 6])
# Output: Sorting using bubble sort

sorter.strategy = QuickSortStrategy.new
sorter.sort([5, 3, 8, 1, 2, 4, 7, 6])
# Output: Sorting using quick sort

sorter.strategy = MergeSortStrategy.new
sorter.sort([5, 3, 8, 1, 2, 4, 7, 6])
# Output: Sorting using merge sort

# In this example, the Sorter class has an internal strategy that determines its behavior. The Sorter class has a sort method that performs
# the sorting algorithm specified by the current strategy.
#
# The client code can use the Sorter class to sort lists of numbers, and the sorter's behavior will change depending on its strategy. The client
# code can change the sorter's strategy by setting a new current strategy.