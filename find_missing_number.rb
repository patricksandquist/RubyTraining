# There is an array of non-negative integers.
# A second array is formed by shuffling the elements of the first array and deleting a random element.
# Given these two arrays, find which element is missing in the second array.

def missing_number(arr1, arr2)
  return arr1.first if arr2.empty?
  arr1.reduce(:+) - arr2.reduce(:+)
end

puts missing_number([4, 4, 2, 6, 0, 3], [6, 4, 2, 3, 4]) == 0
puts missing_number([4, 4, 2, 6, 0, 3], [6, 4, 2, 3, 0]) == 4
puts missing_number([4], []) == 4
