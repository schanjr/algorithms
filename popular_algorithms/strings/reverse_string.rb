# recursion
def reverse_string_recursion(input)
  if input == ""
    return input
  end
  substr = input.slice!(1..input.length)
  reverse_string_recursion(substr) + input[0]
end

# looping
def reverse_string_looping(input)
  l = 0
  r = input.length - 1
  while r > l do
    tmp = input[l]
    input[l] = input[r]
    input[r] = tmp
    r -= 1
    l += 1
  end
  input
end


input = "hello"

puts reverse_string_recursion(input)
puts reverse_string_recursion(input) == reverse_string_looping(input)