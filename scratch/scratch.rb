require 'set'

def longest_valid_parentheses(s)
  balanced = -1
  longest = left_most = 0
  s.chars.each_with_index do |char, idx|
    if char == '('
      left_most = idx
      break
    end
  end
  index = left_most + 1
  while index < s.size do
    char = s[index]
    if char == '('
      balanced -= 1
    elsif char == ')'
      balanced += 1
    end
    if balanced == 0
      longest = (index + 1) - left_most
    end
    index += 1
  end
  longest
end

puts longest_valid_parentheses("(()")
