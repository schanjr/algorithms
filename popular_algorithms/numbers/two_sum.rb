def two_sum(nums, target)
  possible_remainders = {}
  nums.each_with_index  do |value, index|
    subtracted = target - value
    if possible_remainders[value].nil?
      possible_remainders[subtracted] = index
    else
      return [possible_remainders[value], index]
    end
  end
end

puts two_sum([2,7,11,15],9).to_s
puts two_sum([3,2,4],6).to_s
puts two_sum([3,3],6).to_s