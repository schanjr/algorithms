# excellente algorithm removing duplicates from a sorted array.

def sorted_remove_duplicates(nums)
  if nums.length == 0
    return 0
  end

  count = 1

  for i in 1...nums.length
    if nums[i] != nums[i - 1]
      nums[count] = nums[i]
      count += 1
    end
  end

  nums.slice!(count..nums.length)
  return nums
end

puts remove_duplicates([1,1,1,3,3,3,4,5,6,7,8,9, 12, 9100, 9200, 10000])