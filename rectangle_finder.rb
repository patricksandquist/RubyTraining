# Given a 2 dimensional array full of zeros, find the coordinates of the
# rectangle of ones in it. Coordinates may be returned as [upper left, lower right]
# [[0, 0, 0, 0, 0, 0],
#  [0, 1, 1, 1, 0, 0],
#  [0, 1, 1, 1, 0, 0],
#  [0, 0, 0, 0, 0, 0]]
# => [[1, 1], [2, 3]]

def rectangle_finder(arr)
  # Find the upper left coordinates
  ul_row = arr.index { |row| row.include?(1) }
  ul_col = arr[ul_row].index(1)

  # Find the bottom right coordinates from this
  br = bottom_right(arr, [ul_row, ul_col])

  # Return the two together
  [[ul_row, ul_col], br]
end

def bottom_right(arr, ul)
  # Given the upper left coordinates of a rectangle in an array, find the bottom
  # right coordinates

  # First, find the last row of the rectangle
  (ul[0] + 1...arr.length).each do |row|
    if arr[row][ul[1]].zero?
      # Not part of the rectangle
      br_row = row - 1
      break
    end
    # If at the bottom of the array, the rectangle goes to the edge
    if row == arr.length - 1
      br_row = row
      break
    end
end
