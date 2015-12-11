# Given an input string, reverse all the words.
def reverser(str)
  str.split.reverse.join(' ')
end

# Time complexity is O(n).

puts reverser("Hello world!") === "world! Hello"
puts reverser("Hello    world!") === "world! Hello"
puts reverser("My name is Patrick!") === "Patrick! is name My"
puts reverser("") === ""
