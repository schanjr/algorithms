def binary_search(arr, val)
  return -1 if arr.length == 0

  mid = (arr.length - 1) / 2
  mid_remainder = (arr.length - 1) % 2
  if mid_remainder
    if arr[mid + mid_remainder] == val
      return arr[mid + mid_remainder]
    end
  end

  if arr[mid] == val
    return arr[mid]
  end

  if val < arr[mid]
    return binary_search(arr[0..mid], val)
  elsif val > arr[mid]
    return binary_search(arr[(mid+1)..-1], val)
  end
end


arr1 = [0,1,2,3,4,5,6,7]
arr2 = [0,1,2,3,4,5,6,7,8]

arrs = {7=> arr1, 8=>arr2, 9=>arr2}

arrs.each do |val, arr|
  puts "Finding #{val} || binary_search: #{binary_search(arr, val)}"
end