# https://leetcode.com/problems/flip-string-to-monotone-increasing/description/

# non dp method
def min_flips_mono_incr(s)
  cur = s.count('0')
  ans = cur
  s.each_char do |c|
    if c == '0'
      cur -= 1
    else
      cur += 1
    end
    ans = cur if ans > cur
  end
  ans
end

# dp method
def dp_min_flips_mono_incr(s)
  dp = []
  ones = 0
  s.each_char.with_index do |c, i|
    if i == 0
      dp[0] = 0
    else
      flips_if_c_is_in_zeros = ones + (c == '1' ? 1 : 0)
      flips_if_c_is_in_ones = dp[i - 1] + (c == '0' ? 1 : 0)
      dp[i] = [flips_if_c_is_in_zeros, flips_if_c_is_in_ones].min
    end
    if c == '1'
      ones += 1
    end
  end
  dp.last
end