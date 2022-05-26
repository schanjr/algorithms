require 'set'

# https://leetcode.com/problems/remove-invalid-parentheses/
# @topics algorithms -
#   - backtracking
#   - recursion
def remove_invalid_parentheses(s)
  left = 0
  right = 0

  # First, we find out the number of misplaced left and right parentheses.
  s.chars.each do |char|
    # Simply record the left one.
    if char == '('
      left += 1
    elsif char == ')'
      # If we don't have a matching left, then this is a misplaced right, record it.
      right = left == 0 ? right + 1 : right
      # Decrement count of left parentheses because we have found a right
      # which CAN be a matching one for a left.
      left = left > 0 ? left - 1 : left
    end
  end
  result = {}

  # @param s the original string
  # @param index current index
  # @param left_count
  # @param right_count
  # @param left_rem
  # @param right_rem
  # @param expr recursed working set of strings
  recurse = lambda do |s, index, left_count, right_count, left_rem, right_rem, expr|
    # If we reached the end of the string, just check if the resulting expression is
    # valid or not and also if we have removed the total number of left and right
    # parentheses that we should have removed.
    if index == s.size
      if left_rem == 0 && right_rem == 0
        ans = expr.join('')
        result[ans] = 1
      end
    else
      # The discard case. Note that here we have our pruning condition.
      # We don't recurse if the remaining count for that parenthesis is == 0.
      if (s[index] == '(' && left_rem > 0) || (s[index] == ')' && right_rem > 0)
        left_r, right_r = left_rem, right_rem
        if s[index] == '('
          left_r = left_rem - 1
        end
        if s[index] == ')'
          right_r = right_rem - 1
        end
        recurse.call(s, index + 1, left_count, right_count, left_r, right_r, expr)
      end
      expr.append(s[index])
      # Simply recurse one step further if the current character is not a parenthesis.
      if s[index] != '(' && s[index] != ')'
        recurse.call(s, index + 1, left_count, right_count, left_rem, right_rem, expr)

      elsif s[index] == '('
        # Consider an opening bracket.
        recurse.call(s, index + 1, left_count + 1, right_count, left_rem, right_rem, expr)
      elsif s[index] == ')' && left_count > right_count
        # Consider a closing bracket.
        recurse.call(s, index + 1, left_count, right_count + 1, left_rem, right_rem, expr)
      end
      # Pop for backtracking.
      expr.pop
    end
  end
  # Now, the left and right variables tell us the number of misplaced left and
  # right parentheses and that greatly helps pruning the recursion.
  recurse.call(s, 0, 0, 0, left, right, [])
  result.keys
end

# puts remove_invalid_parentheses(")(f")
# puts remove_invalid_parentheses("())(()")
puts remove_invalid_parentheses("()())()")
