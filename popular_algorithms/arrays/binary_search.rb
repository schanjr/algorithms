def binary_search(arr, val)
  search = partition(arr, 0, (arr.length), val)
  return -1 if search.nil?
  search
end

def partition(arr, start, last, val)
  median = (start + last) / 2
  # condition for exiting the function if the value is not in the array at all.
  return nil if start == last && arr[median] != val

  return median if arr[median] == val
  median_remainder = (arr.length - 1) % 2
  if median_remainder
    if arr[median + median_remainder] == val
      return median + 1
    end
  end

  if arr[median] > val
    return partition(arr, start, median, val)
  elsif arr[median] <  val
    return partition(arr, median+1, last, val)
  end
end

def lo_hi_binary_search(arr, target)
  low = 0
  high = arr.length - 1

  while low <= high
    mid = (low + high) / 2
    if arr[mid] == target
      return mid
    elsif arr[mid] < target
      low = mid + 1
    else
      high = mid - 1
    end
  end

  return -1
end


arr = [1, 2, 3, 4, 5, 6]


################ Assertions
# out of index, left most
puts binary_search(arr, 0) == -1
# out of index, right most
puts binary_search(arr, 9) == -1
# value is present, show the left most value
puts binary_search(arr, 2) == 1
# happy path
puts binary_search(arr, 3) == 2

puts lo_hi_binary_search(arr, 6)
