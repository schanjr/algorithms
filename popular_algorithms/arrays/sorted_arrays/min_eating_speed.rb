# https://leetcode.com/problems/koko-eating-bananas/

def min_eating_speed(piles, h)
  low = 1
  high = piles.max
  while low <= high
    return low if low == high
    mid = (low + high) / 2
    if check_able_finish(piles, h, mid)
      high = mid
    else
      low = mid + 1
    end
  end
  low
end

def check_able_finish(piles, h, k)
  sum = 0
  piles.each do |pile|
    sum += (pile / k)
    sum += 1 if pile % k != 0
    return false if sum > h
  end
  true
end

puts min_eating_speed([3, 6, 7, 11], 8) # 4
puts min_eating_speed([30, 11, 23, 4, 20], 5) # 30
puts min_eating_speed([30, 11, 23, 4, 20], 6) # 23