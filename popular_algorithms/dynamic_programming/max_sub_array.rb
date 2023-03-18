# https://leetcode.com/explore/featured/card/top-interview-questions-easy/97/dynamic-programming/566/

# Explanation:
# 1. We loop through all the numbers eventually. FOr each loop, we keep the current maximum, and the best maximum.
# 2.
def max_sub_array(nums)
  best, curr = nums[0], 0
  nums.each do |n|
    curr = [n, curr+n].max #
    best = [best, curr].max
  end
  best
end


# puts max_sub_array([1]) == 1
# puts max_sub_array([]) == 0
puts max_sub_array([5,4,-1,7,8]) == 23