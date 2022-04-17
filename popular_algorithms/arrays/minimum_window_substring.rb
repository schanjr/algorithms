# https://leetcode.com/problems/minimum-window-substring/
# Given two strings s and t of lengths m and n respectively, return the minimum window substring of s such that every character in t (including duplicates) is included in the window. If there is no such substring, return the empty string "".
# The testcases will be generated such that the answer is unique.
# A substring is a contiguous sequence of characters within the string.
# @topics
#   two_pointers,windows
# @example
#  Input: s = "ADOBECODEBANC", t = "ABC"
#  Output: "BANC"
#  Explanation: The minimum window substring "BANC" includes 'A', 'B', and 'C' from string t.
#
#  Input: s = "a", t = "a"
#  Output: "a"
#  Explanation: The entire string s is the minimum window.
#
#  Input: s = "a", t = "aa"
#  Output: ""
#  Explanation: Both 'a's from t must be included in the window.
#  Since the largest window of s only has one 'a', return empty string.
def minimum_window_substring(s, t)
  return "" unless t || s

  # count all the unique characters and store in hash of "t". This will be used for comparison throughout.
  dict_t = t.each_char.with_object(Hash.new(0)) { |c,h| h[c] += 1 }
  # count of required characters minimally. If formed == required, this window has all the required characters.
  required = dict_t.size
  formed = 0

  l = r = 0

  # this hash stores the current window of characters
  window_counts = {}

  # tuples of answers, [smallest window, left pointer, right pointer]
  ans = Float::INFINITY, nil, nil
  while r < s.size do
    # add one character from the right to the current window
    character = s[r]
    window_counts[character] = window_counts.fetch(character, 0) + 1

    # if the frequency of the current character added equals to the desired count in "t", then we increment "formed"
    # formed is used to decide if the inner loop will be entered
    if dict_t[character] && window_counts[character] == dict_t[character]
      formed += 1
    end

    # contract the left pointer if possible. Since formed == required, we can also store
    # our answers intermediately. If multiple answers were found, we store only the one
    # that has least amount of characters.
    while l <= r and formed == required
      character = s[l]

      if r - l + 1 < ans[0]
        ans = r-l+1, l, r
      end

      # because we move the left pointer at the end of the loop, we update the window_counts
      window_counts[character] -= 1
      # if the left pointer is currently a required character, we will deduct formed and stop
      # contracting left pointer at the end of this loop.
      if dict_t[character] and window_counts[character] < dict_t[character]
        formed -= 1
      end
      # since we already found the answer at least one time, we will move the left pointer.
      l += 1
    end
    # keep expanding the right pointer to change the window.
    r += 1
  end

  if ans[0] == Float::INFINITY
    return ""
  else
    s[ans[1],ans[2] - ans[1] + 1]
  end
end

puts minimum_window_substring("ADOBECODEBANC", "ABC")
puts minimum_window_substring("abc", "b")
puts minimum_window_substring("B", "A")
