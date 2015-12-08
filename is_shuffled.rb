# We are given 3 strings: str1, str2, and str3. Str3 is said to be a shuffle of
# str1 and str2 if it can be formed by interleaving the characters of str1 and
# str2 in a way that maintains the left to right ordering of the characters from
# each string.

def is_shuffled?(str1, str2, str3)
end

puts is_shuffled?("abc", "def", "dabecf") == true
puts is_shuffled?("abc", "def", "dbaecf") == false
puts is_shuffled?("abc", "def", "dabecff") == false
puts is_shuffled?("abc", "", "abc") == true
puts is_shuffled?("", "", "") == true
