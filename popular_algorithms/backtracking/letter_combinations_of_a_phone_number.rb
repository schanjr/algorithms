# @param {String} digits
# @return {String[]}

# https://leetcode.com/explore/interview/card/facebook/53/recursion-3/267/discuss/780232/Backtracking-Python-problems+-solutions-interview-prep
# https://leetcode.com/problems/letter-combinations-of-a-phone-number/
# https://www.youtube.com/watch?v=Zq4upTEaQyM # how to backtrack
def letter_combinations_of_a_phone_number(digits)
  digit_to_chars = {
    "2" => ["a", "b", "c"],
    "3" => ["d", "e", "f"],
    "4" => ["g", "h", "i"],
    "5" => ["j", "k", "l"],
    "6" => ["m", "n", "o"],
    "7" => ["p", "q", "r", "s"],
    "8" => ["t", "u", "v"],
    "9" => ["w", "x", "y", "z"]
  }
  results = []
  return results if digits.empty?

  # methods in ruby have closure, cannot access variables outside of the methods. But lambdas, Proc, stabby arrow (->) can .
  backtrack = lambda do |i, current_string|
    # puts "i: #{i}, current_string, #{current_string}"
    if current_string.size == digits.size
      results << current_string
      return
    end
    digit_to_chars[digits[i]].each do |c|
      backtrack.call(i + 1, current_string + c )
    end
  end

  backtrack.call(0, "")
  results
end


res = letter_combinations_of_a_phone_number("234")
puts res.to_s
