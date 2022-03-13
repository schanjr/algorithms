# https://leetcode.com/explore/featured/card/dynamic-programming/631/strategy-for-solving-dp-problems/4045/
# https://leetcode.com/explore/featured/card/dynamic-programming/631/strategy-for-solving-dp-problems/4045/discuss/590781/From-Brute-Force-To-DP

def longest_common_subsequence(text1, text2)
  memo = Array.new(text1.size) { Array.new(text2.size) }
  dp(text1, text2, 0, 0, memo)
end

def dp(text1, text2, i, j, memo)
  # base case for exiting. When either text index reached the full size, that means it finished iterating
  if i == text1.size || j == text2.size
    return 0
  end

  unless memo[i][j].nil?
    return memo[i][j]
  end
  # when a matching text is found, increment both index
  if text1[i] == text2[j]
    return memo[i][j] = 1 + dp(text1, text2, i + 1, j + 1, memo)
  else
    return memo[i][j] = [dp(text1, text2, i + 1, j, memo), dp(text1, text2, i, j + 1, memo)].max
  end
end

puts longest_common_subsequence('abcdefg', 'aace')