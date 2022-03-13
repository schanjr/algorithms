# Main Ideas:
# There is a pivot point chosen. This can be random or just the last element for simplicity.
# The partition function can optionally return the pivot location at the end of partition loops
# At the end one partition loop, all elements to the left of the pivot element should be less than the pivot, and sorted.
# Quick sort is the default sort algorithm for standard libraries.
def quick_sort(array, first, last)
  if first < last
    j = partition(array, first, last)
    quick_sort(array, first, j-1)
    quick_sort(array, j+1, last)
  end
  array
end

def partition(array, first, last)
  puts "partitioning range: #{first}, #{last}"
  pivot = array[last]
  left = first
  right = first
  while right < last
    if array[right] <= pivot
      unless left == right
        array[right], array[left] = array[left], array[right]
        puts "Swapping inner loop #{array.to_s}"
      end
      left += 1
    end
    right += 1
    puts "left: #{left}, right:#{right}"
  end
  array[left], array[last] = array[last], array[left]
  puts "Swapping exit loop #{array.to_s}"
  return left
end

arr = [4, 1, 6, 2, 3, 7, 8, 0]
puts quick_sort(arr, 0, arr.size - 1  )

