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