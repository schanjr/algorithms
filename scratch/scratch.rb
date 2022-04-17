require 'set'

def remove_invalid_parentheses(s)
  level = Set.new(s)
  while true
    valid = level.filter {|item| check_balanced(item)}
    return valid if valid
    level.each do |s|
      s.chars.each_with_index do |_ele, i|

      end
    end
  end
end

def check_balanced(s)
  balanced = 0
  index = 0
  while index < s.size do
    curr = s[index]
    if curr == '('
      balanced += 1
    elsif curr == ')'
      balanced -= 1
    end
    return false if balanced < 0
    index += 1
  end
  balanced == 0
end


# puts remove_invalid_parentheses(")(f")
# puts remove_invalid_parentheses("())(()")
puts remove_invalid_parentheses("()())()")
