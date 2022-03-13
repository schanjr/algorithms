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
      array[right], array[left] = array[left], array[right]
      puts "Swapping inner loop #{array.to_s}"
      left += 1
    end
    right += 1
    puts "left: #{left}, right:#{right}"
  end
  array[left], array[last] = array[last], array[left]
  puts "Swapping exit loop #{array.to_s}"
  return left
end

arr = [4, 1, 6, 3, 7, 2, 9]
puts quick_sort(arr, 0, arr.size - 1  )

