def rob(nums)
  prev = curr = 0
  nums.each do |num|
    temp = prev # This represents the nums[i-2]th value
    prev = curr # This represents the nums[i-1]th value
    curr = [num + temp, prev].max # Here we just plug into the formula
  end
  curr
end

# puts rob([1,2,3,1])
puts rob([2,7,9,3,1])
# puts rob([1,3,1])