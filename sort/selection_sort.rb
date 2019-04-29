# Complexity is about O(n^2)
# Calculation
# n + (n-1) + (n-2).. --> n-n = Total Comparisons needed for each element
# O(1) * Total Comparison = Total Number of Swaps


# Integer comparison implementation
# Gist of how this works - Remember the index of the lowest number of each iterations, and
# at the end of each iteration, move the lowest number to the front.
def selection_sort(ar)
  (0..(ar.size-1)).each do |i|
    smallest = 0
    (i..(ar.size-1)).each do |j|
      if ar[j] > ar[smallest]
        smallest = j
      end
      temp = ar[j]
      ar[j] = ar[smallest]
      ar[smallest] = temp
    end
  end
  ar
end


array = [65, 55, 45, 35, 25, 15, 10]
puts selection_sort(array).to_s
