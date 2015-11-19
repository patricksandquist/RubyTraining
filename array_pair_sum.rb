# O(n^2)
def pair_sum(array, k)
  pairs = []
  (0...array.length - 1).each do |i|
    (i + 1...array.length).each do |j|
      pairs << [array[i], array[j]] if array[i] + array[j] == k
    end
  end

  pairs
end

# O(n * log(n))
def pair_sum2(array, k)
  array.sort!
  i = 0
  j = array.length - 1
  pairs = []
  while i < j
    sum = array[i] + array[j]
    if sum == k
      pairs << [array[i], array[j]]
      i += 1
    elsif sum < k
      i += 1
    else
      j -= 1
    end
  end

  pairs
end

p pair_sum([1,2,3,4,3,1,2], 4)
p pair_sum2([1,2,3,4,3,1,2], 4)
