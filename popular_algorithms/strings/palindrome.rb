## recursion
def is_palindrome_recursion(input)
  if input.length <= 1
    return true
  end

  first = input[0]
  last = input[-1]
  rest = input[1..-2]

  if first == last
    return is_palindrome_recursion(rest)
  else
    return false
  end
end


## loop
def is_palindrome_loop(input)
  l, r = 0, input.length - 1
  while r > l do
    return false if input[l] != input[r]
    r -= 1
    l += 1
  end
  return true
end

inputs = ["kayak", "hello", "racecar"]

inputs.each do |i|
  puts "Word: #{i} || is_palindrome_recursion: #{is_palindrome_recursion(i)} || is_palindrome_loop: #{is_palindrome_loop(i)}"
end