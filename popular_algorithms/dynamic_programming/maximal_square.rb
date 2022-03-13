# https://www.youtube.com/watch?v=6X7Ha2PrDmM
# https://leetcode.com/problems/maximal-square/

# @param {Character[][]} matrix
# @return {Integer}
def maximal_square_top_down(matrix)
  memo = Array.new(matrix.size) { Array.new(matrix[0].size) }
  dp(matrix, 0, 0, memo)
  memo.flatten.max ** 2
end

def dp(matrix, row, col, memo)
  if row >= matrix.size || col >= matrix[0].size
    return 0
  end

  if memo[row][col].nil?
    bottom_left = dp(matrix, row + 1, col, memo)
    top_right = dp(matrix, row, col + 1, memo)
    bottom_right = dp(matrix, row + 1, col + 1, memo)
    memo[row][col] = 0
    if matrix[row][col] == "1"
      memo[row][col] = 1 + [bottom_left, top_right, bottom_right].min
    end
  end
  memo[row][col]
end

def maximal_square_bottom_up(matrix)
  memo = Array.new(matrix.size + 1, 0) { Array.new(matrix[0].size + 1, 0) }
  max_side = 0
  matrix.each_with_index do |row_ele, row|
    row_ele.each_with_index do |col_ele, col|
      if matrix[row][col] == "1"
        memo[row+1][col+1] = [memo[row+1][col], memo[row][col+1], memo[row][col]].min + 1
        max_side = [memo[row+1][col+1], max_side].max
      end
    end
  end
  max_side ** 2
end


input = [["1", "0", "1", "0", "0"], ["1", "0", "1", "1", "1"], ["1", "1", "1", "1", "1"], ["1", "0", "0", "1", "0"]]
input1 = [["1", "1", "1", "1", "1"], ["1", "1", "1", "1", "1"], ["0", "0", "0", "0", "0"], ["1", "1", "1", "1", "1"], ["1", "1", "1", "1", "1"]]
input2 = [["1", "1", "1", "1"], ["1", "1", "1", "1"], ["1", "1", "1", "1"], ["1", "1", "1", "1"]]
puts maximal_square_bottom_up(input)
puts maximal_square_bottom_up(input) == maximal_square_top_down(input)