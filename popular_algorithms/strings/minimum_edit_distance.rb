# https://leetcode.com/problems/edit-distance/
# Given two strings word1 and word2, return the minimum number of operations required to convert word1 to word2.
#   You have the following three operations permitted on a word:
# - Insert a character
# - Delete a character
# - Replace a character
# @topics algorithms -
#   - dynamic_programming
#   - edit_distance
def min_edit_distance(s1, s2)
  memo = Array.new(s1.size + 1) {Array.new(s2.size + 1)}
  dp(s1, s2, s1.size, s2.size, memo)
end

def dp(s1, s2, i, j, memo)
  return j if i == 0
  return i if j == 0

  if s1[i - 1] == s2[j - 1]
    return dp(s1, s2, i-1, j-1, memo)
  end

  if memo[i][j]
    return memo[i][j]
  else
    memo[i][j] = [dp(s1, s2, i-1, j,memo), dp(s1, s2, i, j-1,memo), dp(s1, s2, i-1, j-1,memo)].min + 1
  end
  memo[i][j]
end


puts min_edit_distance("data", "data-analytics")
