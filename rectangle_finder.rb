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
    br_row = row if row == arr.length - 1
  end

  # The find the last column of the rectangle
  (ul[1] + 1...arr[0].length).each do |col|
    if arr[ul[0]][col].zero?
      # Not part of the rectangle
      br_col = col - 1
      break
    end

    # If at the end of the arr, the rectangle extends to the end
    br_col = col if col == arr[0].length
  end

  # Return the two together
  [br_row, br_col]
end
