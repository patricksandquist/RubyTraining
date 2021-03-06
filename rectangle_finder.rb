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
  br_row, br_col = nil

  # First, find the last row of the rectangle
  (ul[0] + 1...arr.length).each do |row|
    if arr[row][ul[1]].zero?
      # Not part of the rectangle
      br_row = row - 1
      break
    end
  end

  # If br_row not defined, the rectangle goes to the edge
  br_row ||= arr.length - 1

  # The find the last column of the rectangle
  (ul[1] + 1...arr[0].length).each do |col|
    if arr[ul[0]][col].zero?
      # Not part of the rectangle
      br_col = col - 1
      break
    end
  end

  # If br_col not defined, the rectangle goes to the edge
  br_col ||= arr[0].length - 1

  # Return the two together
  [br_row, br_col]
end

# Extending this problem further, what if there were multiple rectangles of ones
# in the array? Return a list of all of the rectangles' coordinates. You may assume
# that the rectangles are always separated by zeros.
# [[0, 0, 0, 0, 0, 0],
#  [0, 1, 1, 1, 0, 0],
#  [0, 1, 1, 1, 0, 0],
#  [0, 0, 0, 0, 0, 0],
#  [0, 0, 1, 1, 1, 1],
#  [0, 0, 1, 1, 1, 1]]
# => [[[1, 1], [2, 3]], [[4, 2], [5, 5]]]

def rectangles_finder(arr)
  rectangle_spots = {} # will keep track of where rectangles occupy
  rectangles = [] # will keep track of the rectangle corners for output

  arr.each_with_index do |row, i|
    row.each_with_index do |el, j|
      if el == 1 && !rectangle_spots.include?([i, j])
        # Found a new rectangle corner
        ul = [i, j]
        br = bottom_right(arr, ul)

        # Add the rectangle corners to the output
        rectangles << [ul, br]

        # Add the new coordinates to the hash
        rectangle_spots = update_hash(rectangle_spots, [ul, br])
      end
    end
  end

  # Return the rectangles
  rectangles
end

def update_hash(hash, coords)
  # Given coordinates of a rectangle [upper left, bottom right], add all of the
  # occupied coordinates to the hash and return it
  (coords[0][0]..coords[1][0]).each do |i|
    (coords[0][1]..coords[1][1]).each do |j|
      coord = [i, j]
      hash[coord] = true
    end
  end

  hash
end

test_arr = [
  [0, 0, 0, 0, 0, 0],
  [0, 1, 1, 1, 0, 0],
  [0, 1, 1, 1, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 1, 1, 1, 1],
  [0, 0, 1, 1, 1, 1]
]

puts rectangles_finder(test_arr) == [[[1, 1], [2, 3]], [[4, 2], [5, 5]]]
