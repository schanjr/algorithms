# https://leetcode.com/problems/find-the-town-judge/description/

def find_judge(n, trust)
  return n if n == 1
  degree = Array.new(n+1, 0)
  trust.each do |o, i|
    degree[i] += 1
    degree[o] -= 1
  end
  degree.index(n-1) ? degree.index(n-1) : -1
end


puts find_judge(2, [[1,2]]) # 2
puts find_judge(3, [[1,3],[2,3]])  # 3
puts find_judge(3, [[1,3],[2,3],[3,1]])  # -1