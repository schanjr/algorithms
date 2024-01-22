def maximum_score(nums, multipliers)
  left = score = 0
  right = nums.size - 1
  multipliers.each do |m|
    if nums[left] * m > nums[right] * m
      score += nums[left] * m
      left += 1
    else
      score += nums[right] * m
      right -= 1
    end
  end
  score
end

puts maximum_score([-5,-3,-3,-2,7,1], [-10,-5,3,4,6])