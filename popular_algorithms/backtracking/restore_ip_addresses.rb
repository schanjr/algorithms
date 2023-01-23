# https://leetcode.com/problems/restore-ip-addresses/description/

# each number need to be between 0-255.
# you must have 4 numbers separated by zero
# the starting number should have not a zero in front unless it is 0 itself
def restore_ip_addresses(s)
  results = []
  backtrack(s.split(''), [], results)
  results
end

def backtrack(s, current_result, results)
  if s.length == 0
    results << current_result.join('.') if current_result.size == 4
    return
  end

  num = ''
  s.each_with_index do |char, index|
    num += char
    next if num.length > 1 && num[0] == '0'
    backtrack(s[(index + 1)..-1], current_result + [num], results) if num.to_i <= 255 && current_result.length < 4
  end

end

puts restore_ip_addresses("25525511135")