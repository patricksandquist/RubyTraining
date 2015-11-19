# Given a matrix of integers and coordinates of a rectangular region within
# the matrix, find the sum of numbers falling inside the rectangle. Our
# program will be called multiple times with different rectangular regions from
# the same matrix.

# O(n^2) everytime
def region_sum(matrix, region)
  a = region[0]
  b = region[1]
  sum = 0
  (a[0]..b[0]).each do |i|
    (a[1]..b[1]).each do |j|
      sum += matrix[i][j]
    end
  end

  sum
end

# O(n^2) first time, O(n) everytime after
def region_sum2(matrix, region, summed=nil)
  summed ||= matrix_summer(matrix)
  a = region[0]
  d = region[1]
  if a[0].zero? || a[1].zero?
    oa = 0
  else
    oa = summed[a[0] - 1][a[1] - 1]
  end

  if a[1].zero?
    oc = 0
  else
    oc = summed[d[0]][a[1] - 1]
  end

  if a[0].zero?
    ob = 0
  else
    ob = summed[a[0] - 1][d[1]]
    od = summed[d[0]][d[1]]
  end

  od - ob - oc + oa
end

def matrix_summer(matrix)
  # Returns the corresponding matrix for which numbers above and left are summed
  output = Array.new(matrix.length) { Array.new(matrix[0].length) }

  matrix.each_with_index do |row, i|
    row.each_with_index do |el, j|
      left_sum = output[i][j - 1] || 0
      above_sum = output[i - 1][j] || 0
      doubled_sum = output[i - 1][j - 1] || 0
      output[i][j] = left_sum + above_sum + matrix[i][j] - doubled_sum
    end
  end

  output
end

matrix = [[1, 2, 3, 4, 5],
          [2, 3, 4, 5, 6],
          [3, 4, 5, 6, 7],
          [4, 5, 6, 7, 8]]

puts region_sum(matrix, [[1, 2], [2, 4]]) == 33
puts region_sum2(matrix, [[1, 2], [2, 4]]) == 33
