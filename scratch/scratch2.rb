def find_target_sum_ways(nums, target)
  @results = 0
  target_sum(nums, target, 0)
  @results
end

def target_sum(nums, target, current)
  if nums.size == 0 && current == target
    return @results += 1
  end

  unless nums.empty?
    target_sum(nums[1..-1], target, current + nums[0])
    target_sum(nums[1..-1], target, current - nums[0])
  end
end

def find_target_sum_ways(nums, target)
  @dp = {}
  backtrack(nums, target, 0, 0)
end

def backtrack(nums, target, i, total)
  if i == nums.size
    if total == target
      return 1
    else
      return 0
    end
  end
  return @dp["#{i}, #{total}"] if @dp["#{i}, #{total}"]
  @dp["#{i}, #{total}"] = (backtrack(nums, target, i + 1, total + nums[i])) +
                          (backtrack(nums, target, i + 1, total - nums[i]))
  return @dp["#{i}, #{total}"]
end

find_target_sum_ways([1, 1, 1, 1, 1], 3)