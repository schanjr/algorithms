# https://leetcode.com/problems/subarray-sum-equals-k/
#
# First of all, the basic idea behind this code is that, whenever the sums has increased by a value of k, we've found a subarray of sums=k.
# I'll also explain why we need to initialise a 0 in the hashmap.
#
# Example: Let's say our elements are [1,2,1,3] and k = 3. <br>
# And our corresponding running sums = [1,3,4,7]. <br>
# Now, if you notice the running sums array, from 1->4, there is increase of k and from 4->7, there is an increase of k. So, we've found 2 subarrays of sums=k.
#
# But, if you look at the original array, there are 3 subarrays of sums==k. Now, you'll understand why 0 comes in the picture.
#
# In the above example, 4-1=k and 7-4=k. Hence, we concluded that there are 2 subarrays.
# However, if sums==k, it should've been 3-0=k. But 0 is not present in the array. To account for this case, we include the 0.
# Now the modified sums array will look like [0,1,3,4,7]. Now, try to see for the increase of k.
#
# - 0->3
# - 1->4
# - 4->7
# Hence, 3 sub arrays of sums=k
# This clarified some confusions I had while doing this problem.
def subarray_sum_equals_k(nums, k)
  ans = 0
  pref_sum = 0
  d = { 0 => 1 }
  nums.each do |num|
    pref_sum = pref_sum + num
    if d[pref_sum - k]
      ans = ans + d[pref_sum - k]
    end
    d[pref_sum] = d.fetch(pref_sum, 0) + 1
  end
  ans
end

puts subarray_sum_equals_k([1, 2, 1, 3], 3) # subarray are [1,2] [2,1] [3]: Answer is 3
puts subarray_sum_equals_k([5, 2, 7, 9, 10, -4, 5, 7, 0, 4, 3, 6], 7) # [5,2] [7] [7] [7,0] [0,4,3] [4,3] # Answer is 6
