# Given an array of integers (positive and negative) find the largest continuous sum.
def lcs(arr)
  max = arr.first || 0 # return zero for empty array
  current_sum = 0

  arr.each do |num|
    current_sum += num
    max = current_sum if current_sum > max
    current_sum = 0 if current_sum < 0
  end

  max
end

puts lcs([5, 3, -7, 6]) == 8
puts lcs([5, 3, -7, 6, 4]) == 11
puts lcs([5]) == 5
puts lcs([]) == 0

# Time complexity is O(n) and space complexity is O(1)
