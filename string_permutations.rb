# Generate all permutations of a given string.
def permutations(str)
  return [str] if str.length < 2

  output = []
  lower_perms = permutations(str[1..-1])
  letter = str[0]

  lower_perms.each do |perm|
    (0..perm.length).each do |i|
      output << perm[0...i] + letter + perm[i..-1]
    end
  end

  output
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
