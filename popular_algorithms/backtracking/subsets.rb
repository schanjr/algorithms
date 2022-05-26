# https://leetcode.com/problems/subsets/
# @topics algorithms -
#   - backtracking
#   - permutations
def subsets(nums)
  subsets = [[]]
  nums.each do |num|
    tmp_subset = []
    subsets.each do |i|
      tmp_subset << i + [num]
    end
    subsets += tmp_subset
  end
  subsets
end

# dfs method
def subsets_dfs(nums)
  result = []
  dfs = lambda do |subset, index|
    if index == nums.size
      result.append(subset)
      return
    end
    dfs.call(subset + [nums[index]], index + 1)
    dfs.call(subset, index + 1)
  end

  dfs.call([], 0)
  result
end

subsets([1,2,3])
