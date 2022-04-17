# https://leetcode.com/explore/featured/card/top-interview-questions-easy/102/math/878/

# rdoc-image:assets/roman_to_int.png
def roman_to_int(s)
  lookup = { "I" => 1,
             "V" => 5,
             "X" => 10,
             "L" => 50,
             "C" => 100,
             "D" => 500,
             "M" => 1000 }
  z = 0
  0.upto(s.size - 2).each do |i|
    if lookup[s[i]] < lookup[s[i + 1]]
      z -= lookup[s[i]]
    else
      z += lookup[s[i]]
    end
  end
  z + lookup[s[-1]]
end

puts roman_to_int("XX") # 20
puts roman_to_int("MCMXCIV") # 1994
