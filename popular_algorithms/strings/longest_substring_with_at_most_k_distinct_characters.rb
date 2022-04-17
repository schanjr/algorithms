# https://leetcode.com/explore/interview/card/facebook/5/array-and-strings/3017/
#
# Given a string s and an integer k, return the length of the longest substring of s that contains at most k distinct characters.
# "eceba" , 2
# > returns 3 for "ece"
# @param {String} s
# @param {Integer} k
# @return {Integer}
# @topics algorithms -
#   - two pointers
#   - sliding window
def length_of_longest_substring_k_distinct(s, k)
  if k == 0
    return 0
  end

  length = s.size
  return length if k > length

  left, right, max_len = 0, 0, 0
  right_most_position = {}

  while right < length
    char = s[right]
    right_most_position[char] = right
    right += 1

    if right_most_position.size > k
      lower_idx = right_most_position.values.min
      right_most_position.delete(s[lower_idx])
      left = lower_idx + 1
    end

    max_len = [max_len, right - left].max
  end

  max_len
end

puts length_of_longest_substring_k_distinct("ababffzzeee", 2) # 5 for "zzeee"


# Another Algo I wrote maybe easier to understand.
# def length_of_longest_substring_k_distinct(s, k)
#   # tuple max_size, left, right ranges
#   return s.size if k > s.size
#   answer = 0, nil, nil
#   left = right = 0
#   char_counts = {}
#   distinct_k = Set.new
#   while left <= right && right < s.size
#     while right < s.size && distinct_k.size <= k
#       char = s[right]
#       char_counts[char] = char_counts.fetch(char, 0) + 1
#       distinct_k.add(char)
#
#       if distinct_k.size <= k && right - left + 1 > answer[0]
#         answer = right - left + 1, left, right
#       end
#
#       right += 1
#       break if !distinct_k.include?(s[right]) && distinct_k.size >= k
#     end
#     char_counts[s[left]] -= 1 if char_counts[s[left]]
#     distinct_k -= [s[left]] if char_counts[s[left]] == 0
#     left += 1
#   end
#   answer[0]
# end
