# Given a matrix of integers and coordinates of a rectangular region within
# the matrix, find the sum of numbers falling inside the rectangle. Our
# program will be called multiple times with different rectangular regions from
# the same matrix.

def region_sum(matrix, region)
  top_left = region[0]
  bottom_right = region[1]
  sum = 0
  (top_left[0]..bottom_right[0]).each do |i|
    (top_left[1]..bottom_right[1]).each do |j|
      sum += matrix[i][j]
    end
  end

  sum
end

matrix = [[1, 2, 3, 4, 5],
          [2, 3, 4, 5, 6],
          [3, 4, 5, 6, 7],
          [4, 5, 6, 7, 8]]

puts region_sum(matrix, [[1, 2], [2, 4]]) == 33
