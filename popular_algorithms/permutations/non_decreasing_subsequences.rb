# https://leetcode.com/problems/non-decreasing-subsequences/description/

require 'set'

def find_subsequences(nums)
  results = Set.new
  find_sequence(nums, [], results)
  results.to_a
end

def find_sequence(nums, current, results)
  return if results.include?(current)
  results.add(current) if current.length >= 2
  return if nums.empty?

  nums.each_with_index do |num, index|
    unless current.any? && current.last > num
      find_sequence(nums[index+1..-1], current + [num], results)
    end
  end
end

puts find_subsequences([4,4,3,2,1]).to_s # [[4,4]]
puts find_subsequences([4,6,7,7]).to_s # [[4,6],[4,6,7],[4,6,7,7],[4,7],[4,7,7],[6,7],[6,7,7],[7,7]]