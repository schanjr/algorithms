# https://leetcode.com/problems/best-time-to-buy-and-sell-stock/

def max_profit(prices)
  max_profit = 0
  min_price = Float::INFINITY
  prices.each do |price|
    min_price = price if price < min_price
    profit = price - min_price
    max_profit = [max_profit, profit].max
  end
  max_profit
end

puts max_profit([3, 0, 0])
