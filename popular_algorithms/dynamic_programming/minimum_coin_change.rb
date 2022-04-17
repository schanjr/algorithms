
# https://www.youtube.com/watch?v=H9bfqozjoqs
# bottom up approach. Start from 0..Amount Sub problems.
def coin_change(coins, amount)
  dp = Array.new(amount + 1, Float::INFINITY )
  dp[0] = 0
  (1..(amount)).each do |a|
    coins.each do |c|
      if a - c >= 0
        dp[a] = [dp[a], 1 + dp[a-c]].min
      end
    end
  end
  if dp[amount] != amount + 1
    dp[amount]
  else
    -1
  end
end

coins = [186,419,83,408]
amount = 6249
puts coin_change(coins, amount)
