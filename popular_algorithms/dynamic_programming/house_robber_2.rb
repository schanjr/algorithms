# https://leetcode.com/problems/house-robber-ii/

# dynamic programming
def rob(nums)
  return nums.max if nums.size <= 3
  [simple_rob(nums.slice(0, nums.size - 1)), simple_rob(nums.slice(1, nums.size))].max
end

def simple_rob(nums)
  prev = curr = 0
  nums.each { |num|
    temp = prev # This represents the nums[i-2]th value
    prev = curr # This represents the nums[i-1]th value
    curr = [num + temp, prev].max # Here we just plug into the formula
  }
  curr
end

puts rob([200,3,140,20,10])
puts rob([[1,2,3,1]])
puts rob([0])