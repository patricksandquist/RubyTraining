# We are given 3 strings: str1, str2, and str3. Str3 is said to be a shuffle of
# str1 and str2 if it can be formed by interleaving the characters of str1 and
# str2 in a way that maintains the left to right ordering of the characters from
# each string.

def is_shuffled?(str1, str2, str3)
  return false unless str1.length + str2.length == str3.length
  return false if str1[0] != str3[0] && str2[0] != str3[0]

  if str1.empty? || str2.empty?
    return true if str1 + str2 == str3
  end

  if str1[0] == str3[0] && is_shuffled?(str1[1..-1], str2, str3[1..-1])
    return true
  end

  if str2[0] == str3[0] && is_shuffled?(str1, str2[1..-1], str3[1..-1])
    return true
  end

  return false
end

# Time complexity is O(n) where n is the length of str3.

puts is_shuffled?("abc", "def", "dabecf") == true
puts is_shuffled?("abc", "def", "dbaecf") == false
puts is_shuffled?("abc", "def", "dabecff") == false
puts is_shuffled?("abc", "", "abc") == true
puts is_shuffled?("", "", "") == true
