# https://leetcode.com/problems/generate-parentheses/description/

# Summary:
#   1. Use Opened and Closed pointer method to check valid parentheses
#   2. Each recursion iteration generates 2 more recursion for adding and closing parentheses.
#   3. n is passed to the recursion to check final results
def generate_parenthesis(n)
  res = []
  gen(res, n, 0, 0, '')
  res
end

def gen(res, n, o, c, s)
  if o == c && o == n
    res << s
  end

  if o < n
    gen(res, n, o + 1, c, "#{s}(")
  end

  if c < o
    gen(res, n, o, c + 1, "#{s})")
  end
end

generate_parenthesis(5).to_s

