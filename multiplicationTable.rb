# Print out the table in a matrix like fashion, each number formatted to a width
# of 4 (The numbers are right-aligned and strip out leading/trailing spaces on each line).

(1..12).each do |i|
  (1..12).each do |j|
    product = i * j
    if j == 1
      print product
    else
      print " " * (4 - product.to_s.length) + product.to_s
    end
  end
  puts
end

# The time complexity of this is O(n^2) where n is the maximum number being
# multiplied by itself. This is due to the nested loop nature.
