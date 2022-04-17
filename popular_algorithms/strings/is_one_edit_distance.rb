# https://leetcode.com/problems/one-edit-distance/
# @topics algorithms -
#   - two_pointers
#   - edit_distance
def is_one_edit_distance(s, t)
  return false if s == t

  l1, l2 = s.size, t.size
  if l1 > l2
    # make sure string "t" is always bigger or equal to s. We will do a subtraction next line
    return is_one_edit_distance(t, s)
  end

  if l2 - l1 > 1
    return false # no point of doing comparison if there are more than one character difference. Not one edit distance.
  end

  0.upto(l1).each do |i|
    if s[i] != t[i]
      if l1 == l2 # If they are same size, replace what is found in t to s. REPLACEMENT
        s = s[0, i] + t[i] + s[i + 1, s.size]
      else
        # if they are not the same size, take whatever that is in t, and add it to s. INSERTION
        s = s[0, i] + t[i] + s[i, s.size]
      end
      break # optimization logic, there should only be one edit distance. No need to further iterate.
    end
  end
  s == t #|| s == t[0,t.size - 1]  # Don't think this part is necessary since we make sure t is greater and we handle the insertion above...
end

puts is_one_edit_distance("ab", "acb") # true
puts is_one_edit_distance("ab", "ba") # false
puts is_one_edit_distance("ab", "ba") # false
puts is_one_edit_distance("aca", "caca") # true
