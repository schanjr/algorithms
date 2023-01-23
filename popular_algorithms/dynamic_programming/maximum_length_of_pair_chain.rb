# https://leetcode.com/problems/maximum-length-of-pair-chain/

def find_longest_chain(pairs)
  pairs.sort_by!(&:last)

  seq = 0
  prev = -10000

  pairs.each do |(i, j)|
    if i > prev
      seq += 1
      prev = j
    end
  end

  seq
end


puts find_longest_chain([[1,2],[2,3],[3,4]]) # 2
puts find_longest_chain([[1,2],[7,8],[4,5]]) # 3
puts find_longest_chain([[-10,-8],[8,9],[-5,0],[6,10],[-6,-4],[1,7],[9,10],[-4,7]]) # 4
puts find_longest_chain([[-6,9],[1,6],[8,10],[-1,4],[-6,-2],[-9,8],[-5,3],[0,3]])  # 3