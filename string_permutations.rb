# Generate all permutations of a given string.
def permutations(str)
end

puts permutations("ABC").sort == ["ABC", "BAC", "BCA", "ACB", "CAB", "CBA"].sort # order doesn't matter
puts permutations("AB").sort == ["AB", "BA"].sort # order doesn't matter
puts permutations("dogs").sort == [
  "dogs", "sgod", "gsod", "ogsd",
  "dosg", "sgdo", "gsdo", "ogds",
  "dsgo", "sdgo", "gdso", "osdg",
  "dsog", "sdog", "gdos", "osgd",
  "dgso", "sodg", "gods", "odgs",
  "dgos", "sogd", "gosd", "odsg"
].sort # order doesn't matter
