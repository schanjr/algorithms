# https://leetcode.com/problems/valid-palindrome-ii/
#
# Given a string s, return true if the s can be palindrome after deleting at most one character from it.
# @example Input: s = "aba"
#   Output: true
#
# @example Input: s = "abca"
#   Output: true
#   Explanation: You could delete the character 'c'.
def valid_palindrome_ii(s)
  valid_palindrome?(s,0,s.size - 1)
end

def valid_palindrome?(s, l,r,deletes=1)
  while l < r
    if s[l] == s[r]
      l += 1
      r -= 1
    else
      if deletes != 0
        delete_left = valid_palindrome?(s, l+1, r, 0)
        delete_right = valid_palindrome?(s,l, r - 1, 0)
        return [delete_left, delete_right].any?
      else
        return false
      end
    end
  end
  true
end

puts valid_palindrome_iii("aca")
# puts valid_palindrome("abca")
# puts valid_palindrome("bddb")
