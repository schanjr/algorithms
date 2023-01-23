# https://leetcode.com/problems/palindrome-partitioning/description/

def partition(s)
  result = []
  backtrack(s, [], result)
  result
end

def backtrack(s, curr, result)
  if s.size == 0
    result << curr.dup
  end

  sample = ""
  s.each_char.with_index do |char, index|
    sample += char
    backtrack(s[(index+1)..-1], curr + [sample], result) if is_palindrome(sample)
  end
end

def is_palindrome(s)
  s == s.reverse
end

puts partition("aab").to_s