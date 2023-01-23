# https://leetcode.com/problems/permutations/
def permute(nums)
  results = []
  generator(nums, 0, nums.size - 1, results )
  results
end

def generator(nums, left, right, results )
  if left == right
    return results << nums.dup
  else
    (left..right).each do |i|
      nums[left], nums[i] = nums[i], nums[left]
      generator(nums, left+1, right, results)
      nums[left], nums[i] = nums[i], nums[left]
    end
  end
end


puts permute([1,2,3]).to_s
