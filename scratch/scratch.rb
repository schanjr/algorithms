def rotate(matrix)
  l, r = 0, matrix.length - 1
  while l < r
    0.upto(r - l - 1).each do |i|
      top, bottom = l, r

      # save the top left
      top_left = matrix[top][l + i]

      # move bottom left to top left
      matrix[top][l + i] = matrix[bottom - i][l]

      # move bottom right to bottom left
      matrix[bottom - i][l] = matrix[bottom][r - i]

      # move top right to bottom right
      matrix[bottom][r - i] = matrix[top + i][r]

      # move previous top left to top right
      matrix[top + i][r] = top_left
    end
    r -= 1
    l += 1
  end
  matrix
end

matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
output = [[7, 4, 1], [8, 5, 2], [9, 6, 3]]
puts rotate(matrix) == output


