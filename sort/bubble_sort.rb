# Complexity is about O(n^2)
# Calculation
# n + (n-1) + (n-2).. --> n-n = Total Comparisons needed for each element
# O(1) * Total Comparison = Total Number of Swaps


# Integer comparison implementation
# Gist of how this works - Move largest number to the last element of the array to the right most
# after each iterations
def bubble_sort(array)
  unsorted_until_index = array.size - 1
  sorted = false
  until sorted
    sorted = true
    (0..(unsorted_until_index - 1)).each do |index|
      if array[index] > array[index + 1]
        sorted = false
        # Swap places with next element if is bigger
        array[index], array[index + 1] = array[index + 1], array[index]
      end
    end
    # After first pass through is over, we guaranteed that the last element is the biggest number,
    #   so no need to sort the last element.
    unsorted_until_index -= 1
  end
  array
end


array = [65, 55, 45, 35, 25, 15, 10]
puts bubble_sort(array).to_s
