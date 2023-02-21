# https://leetcode.com/explore/learn/card/dynamic-programming/631/strategy-for-solving-dp-problems/4146

#2d
def maximum_score_2d(nums, mult)
  n = nums.size
  m = mult.size
  dp = Array.new(n+1,0) {|| Array.new(m+1,0)}
  (m - 1).downto(0).each do |k|
    (k).downto(0).each do |i|
      dp[i][k] = [
        mult[k] * nums[i] + dp[i + 1][k + 1],
        mult[k] * nums[n - 1 - k + i] + dp[i][k + 1]
      ].max
    end
  end
  dp[0][0]
end

#1d


puts maximum_score_2d([-5, -3, -3, -2, 7, 1], [-5, -3, -3, -2, 7, 1])