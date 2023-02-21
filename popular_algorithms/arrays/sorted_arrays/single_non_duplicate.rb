# https://leetcode.com/problems/single-element-in-a-sorted-array/description/
require "./support_tools/easy_benchmark"


def iter_single_non_duplicate(nums)
  index = 0
  while index < nums.size - 1 do
    num = nums[index]
    if num == nums[index + 1]
      index += 1
    else
      return num
    end
    index += 1
  end
  nums.last
end

def binary_single_non_duplicate(nums)
  lo, hi = 0, nums.size - 1

  while lo < hi
    mid = ( lo + hi ) / 2
    # we always check for even index
    # if the left part (lo..mid) doesn't have single element
    # then mid, mid + 1 should be a repeating pair
    mid -= 1 if mid.odd?

    # if we didn't find a pair, the single element should be on the left
    if nums[mid] != nums[mid + 1]
      hi = mid
    else
      lo = mid + 2
    end
  end

  nums[lo]
end

EasyBenchmark.iterations = 10000
EasyBenchmark.benchmark_time(["iter_single_non_duplicate", "binary_single_non_duplicate"], [3,3,7,7,10,11,11,12,12])


