# https://leetcode.com/problems/container-with-most-water/
# measure container with the most water

# @param {Integer[]} height
# @return {Integer}
def max_area(height)
  left, right = 0, height.size - 1
  water = 0
  while left < right
    current_water = (right - left) * [height[left], height[right]].min
    water = [water, current_water].max
    if height[left] < height[right]
      left += 1
    else
      right -= 1
    end
  end
  water
end


puts max_area([[1,8,6,2,5,4,8,3,7]]) == 49