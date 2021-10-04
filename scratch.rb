# @param {Integer[]} nums
# @return {Integer}
def remove_duplicates(nums)
  if nums.length == 0
    return 0
  end

  count = 1

  for i in 1...nums.length
    if nums[i] != nums[i - 1]
      nums[count] = nums[i]
      count += 1
    end
    puts nums.to_s
  end

  return count
end

puts remove_duplicates([1,1,1,3,3,3,4,5,6,7,8,9])