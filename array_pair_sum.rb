# O(n^2)
def pair_sum(array, k)
  pairs = []

  (0...array.length - 1).each do |i|
    (i + 1...array.length).each do |j|
      a = array[i]
      b = array[j]
      pairs << [[a, b].min, [a, b].max] if a + b == k
    end
  end

  pairs.uniq
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
      pairs << [[array[i], array[j]].min, [array[i], array[j]].max]
      i += 1
    elsif sum < k
      i += 1
    else
      j -= 1
    end
  end

  pairs.uniq
end

# O(n)
def pair_sum3(array, k)
  seen = {}
  pairs = []

  array.each do |el|
    target = k - el
    if seen[target]
      pairs << [[el, target].min, [el, target].max]
    end
    seen[el] = true
  end

  pairs.uniq
end

p pair_sum([1,2,3,4,3,1,2], 4)
p pair_sum2([1,2,3,4,3,1,2], 4)
p pair_sum3([1,2,3,4,3,1,2], 4)
