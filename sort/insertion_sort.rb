# Complexity is about O(n^2)
# Calculation
# n + (n-1) + (n-2).. --> n-n = Total Comparisons needed for each element
# (n-1) + (n-2) + (n-3) --> n-n = Total Number of Swaps

# Integer comparison implementation
# Gist of how this works - Remember the index of the lowest number of each iterations, and
# at the end of each iteration, move the lowest number to the front.
def insertion_sort(ar)
  ar
end


array = [65, 55, 45, 35, 25, 15, 10]
puts insertion_sort(array).to_s
