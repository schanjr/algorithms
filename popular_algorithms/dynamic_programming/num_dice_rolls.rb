# 1155. Number of Dice Rolls With Target Sum
# https://leetcode.com/problems/number-of-dice-rolls-with-target-sum/description/?

def num_rolls_to_target(d, f, target)
  @dp = Array.new(d+1)
  ways(d, f, target)
end

def ways(d, f, target)
  return 1 if d == 0 && target == 0
  return 0 if d < 0 || target < 0
  return @dp[d][target] if @dp[d] && @dp[d][target]
  count = 0
  (1..f).each { |val|
    count += ways(d-1, f, target-val)
  }
  @dp[d] ||= []
  puts @dp.to_s
  @dp[d][target] = count % ((10**9)+7)
end

num_rolls_to_target(30, 30, 500)