# animation: https://www.hackerearth.com/practice/algorithms/sorting/quick-sort/visualize/
# Main Ideas:
# There is a pivot point chosen. This can be random or just the last element for simplicity.
# The partition function can return the pivot location at the end of partition loops.
# At the end one partition loop, all elements to the left of the pivot element should be less than the pivot.
# All elements to the right of the pivot element should be more than the pivot.
# The partition return function needs to return the pivot.
# Quick sort is the default sort algorithm for standard libraries.
def quick_sort(array, first, last)
  if first < last
    j = partition(array, first, last)
    puts "*" * 40
    puts "pivot provided is #{j}"
    quick_sort(array, first, j-1)
    quick_sort(array, j+1, last)
  end
  array
end

def partition(array, first, last)
  puts "*" * 20
  puts "partitioning range: #{first}, #{last}"
  left = first
  right = first
  while right < last
    puts "##### starting positions: left: #{left}, right:#{right}"
    if array[right] <= array[last] # array last is pivot
      unless left == right
        puts "Swapping inner loop before:#{array.to_s}"
        array[right], array[left] = array[left], array[right]
        puts "Swapping inner loop after: #{array.to_s}"
      end
      left += 1
    end
    right += 1
    puts "##### ending positions: left: #{left}, right:#{right}"
    puts
  end
  # swap left and pivot at the end of loop
  puts "Exchanging Pivot Before: #{array.to_s}"
  array[left], array[last] = array[last], array[left]
  puts "Exchanging Pivot After: #{array.to_s}"
  puts
  return left
end

arr = [4,5,8,10,3,3,2,1, 12, 18]
puts quick_sort(arr, 0, arr.size - 1  ).to_s



def quick_sort_simple(arr)
  return arr if arr.length <= 1
  pivot = arr.pop
  less = []
  greater = []
  arr.each do |x|
    if x <= pivot
      less << x
    else
      greater << x
    end
  end
  quick_sort_simple(less) + [pivot] + quick_sort_simple(greater)
end

puts quick_sort_simple(arr).to_s

