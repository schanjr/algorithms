# Complexity is about O(n^2)
# Calculation
# n + (n-1) + (n-2).. --> (n^2)/2 = Total Comparisons needed for each element
# n + (n-1) + (n-2).. --> (n^2)/2 = Total Number of element overwriting
#

# Integer comparison implementation
# Gist of how this works - Moving from left to right, cut out a boundary of the array starting between
# index 0 and index 1. Pick one element at the time, and compare the left side.
# Move lowest number to the left at the end of each iteration.

def insertion_sort(ar)
  (1..(ar.size - 1)).each do |index|
    position = index
    temp_value = ar[index]
    while (position > 0) && (ar[position - 1] > temp_value)
      ar[position] = ar[position - 1]
      position = (position - 1)
    end
    ar[position] = temp_value
  end
end


array = [65, 55, 45, 35, 25, 15, 10]
insertion_sort(array)
puts array.to_s













