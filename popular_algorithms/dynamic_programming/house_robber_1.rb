# https://leetcode.com/problems/house-robber/
# https://leetcode.com/problems/house-robber/discuss/156523/From-good-to-great.-How-to-approach-most-of-DP-problems.

def simple_rob(nums)
  prev = curr = 0
  nums.each { |num|
    temp = prev # This represents the nums[i-2]th value
    prev = curr # This represents the nums[i-1]th value
    curr = [num + temp, prev].max # Here we just plug into the formula
  }
  curr
end

puts simple_rob([1,0,0,1000,1002,2,3])