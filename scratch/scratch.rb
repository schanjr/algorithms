def can_make_arithmetic_progression(arr)
  diff = arr[0] - arr[1]
  index = 0
  reversed_arr = arr.reverse
  reverse_diff = arr[0] - arr[1]
  while index < arr.size - 2 do
    new_diff = arr[index] - arr[index + 1]
    return false if diff != new_diff

    new_reverse_diff = reversed_arr[index] - reversed_arr[index + 1]
    return false if new_reverse_diff != reverse_diff

    index += 1
  end
  true
end

puts can_make_arithmetic_progression([3,5,1])