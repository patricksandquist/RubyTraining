# Write a program which reverses the words in an input sentence.
# The first argument is a file that contains multiple sentences, one per line.
# Empty lines are also possible. Print to stdout each sentence with the reversed
# words in it, one per line. Empty lines in the input should be ignored.
# Ensure that there are no trailing empty spaces in each line you print.

def reverseWords(line)
  words = line.split(" ")
  words.reverse.join(" ")
end

puts reverseWords("Hello world") == "world Hello"
puts reverseWords("") == ""

# Time complexity is O(n) where n is the number of words in the line
