def check_parentheses_balanced(s)
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

puts check_parentheses_balanced("()())()")
