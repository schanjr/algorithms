# https://leetcode.com/problems/valid-sudoku/
# Solution summary
# - use the #.add? method in set to see if there are duplicates
# - solution only works if the inputs are either 0-9 or '.', otherwise use hash to check.
# - the most difficult concept is accessing the row, columns, and 9/9 box pattern. Just need to remember this part for other solutions to work as
# well.
# @param {Character[][]} board
# @return {Boolean}
def is_valid_sudoku(board)
  boxes = Array.new(3) { Array.new(3) { Set.new } }
  rows = Array.new(9) { Set.new }
  cols = Array.new(9) { Set.new }

  board.each_with_index do |array, row|
    array.each_with_index do |num, col|
      next if num == '.'
      return false unless boxes[row/3][col/3].add?(num) && rows[row].add?(num) && cols[col].add?(num)
    end
  end
  true
end