# @param {Integer[]} nums
# @return {Integer[][]}
def three_sum(nums)
  triplets = []
  i = 0
  j = i + 1
  z = nums.length - 1

  while !nums.empty? do
    while z > j do
      return triplets if nums.length < 3
      first_num = nums[i]
      second_num = nums[j]
      two_sum = first_num + second_num
      third_num = two_sum * -1
      if nums.slice(j + 1, z).include?(third_num)
        triplets << [nums.delete_at(nums.index(first_num)), nums.delete_at(nums.index(second_num)), nums.delete_at(nums.rindex(third_num))]
        i = 0
        j = i + 1
        z = nums.length - 1
      end
      j += 1
    end
  end
  triplets
end

def subset_sum(numbers, target, partial=[])
  s = partial.inject(0, :+)
  # check if the partial sum is equals to target

  puts "sum(#{partial})=#{target}" if s == target && partial.length == 3

  return if s >= target # if we reach the number why bother to continue

  (0..(numbers.length - 1)).each do |i|
    n = numbers[i]
    remaining = numbers.drop(i+1)
    subset_sum(remaining, target, partial + [n])
  end
end


subset_sum([3,9,8,4,5,7,10],15)