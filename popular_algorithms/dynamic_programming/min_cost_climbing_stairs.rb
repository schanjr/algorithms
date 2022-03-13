# https://leetcode.com/explore/learn/card/dynamic-programming/631/strategy-for-solving-dp-problems/4040/discuss/476388/4-ways-or-Step-by-step-from-Recursion-greater-top-down-DP-greater-bottom-up-DP-greater-fine-tuning
# dynamic programming

def min_cost_climbing_stairs(cost)
  n = cost.size
  memo = { -1 => 0, -2 => 0 }
  [min_cost(cost, n - 1, memo), min_cost(cost, n - 2, memo)].min
end

def min_cost(cost, n, memo)
  return 0 if n < 0
  return memo[n] unless memo[n].nil?
  memo[n] = cost[n] + [min_cost(cost, n - 1, memo), min_cost(cost, n - 2, memo)].min
  memo[n]
end

puts min_cost_climbing_stairs([10, 15, 20]) == 15
puts min_cost_climbing_stairs([1, 100, 1, 1, 1, 100, 1, 1, 100, 1]) == 6
puts min_cost_climbing_stairs([0, 1, 1, 1])
puts min_cost_climbing_stairs([0, 1, 1, 1]) == 1