# https://leetcode.com/problems/next-permutation/
#
# A permutation of an array of integers is an arrangement of its members into a sequence or linear order.
#
# For example, for arr = [1,2,3], the following are considered permutations of arr: [1,2,3], [1,3,2], [3,1,2], [2,3,1].
# The next permutation of an array of integers is the next lexicographically greater permutation of its integer. More formally, if all the permutations of the array are sorted in one container according to their lexicographical order, then the next permutation of that array is the permutation that follows it in the sorted container. If such arrangement is not possible, the array must be rearranged as the lowest possible order (i.e., sorted in ascending order).
#
# For example, the next permutation of arr = [1,2,3] is [1,3,2].
# Similarly, the next permutation of arr = [2,3,1] is [3,1,2].
# While the next permutation of arr = [3,2,1] is [1,2,3] because [3,2,1] does not have a lexicographical larger rearrangement.
# Given an array of integers nums, find the next permutation of nums.
#
# The replacement must be in place and use only constant extra memory.
# 65ms solution
def next_permutation(nums)
  index = nums.size - 1
  return nums if nums.size <= 1

  while true do
    if index == 0 # means everything is sorted desc like [3,2,1]
      return nums.reverse!
    elsif nums[index - 1] >= nums[index]
      index -= 1
    elsif nums[index - 1] < nums[index]
      next_larger_index = find_just_larger(nums, nums[index - 1])
      swap(nums, index - 1, next_larger_index)
      nums[index..nums.size - 1] = nums[index..nums.size - 1].reverse
      return nums
    end
  end
end

def find_just_larger(nums, a)
  index = nums.size - 1
  while nums[index] <= a
    index -= 1
  end
  index
end

def swap(nums, a, b )
  nums[a], nums[b] = nums[b], nums[a]
end

puts next_permutation([1,5,8,4,7,6,5,3,1]).to_s
puts next_permutation([1,5,8,5,1,3,5,6,7]).to_s

# 158476531
# 158513567
# 158513576
