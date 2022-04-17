# https://leetcode.com/explore/featured/card/top-interview-questions-easy/96/sorting-and-searching/587/
# The problem only allows modification of inplace algorithms... TC O(n+m), SC O(1)
def merge_sorted_arrays(nums1, m, nums2, n)
  while m > 0 and n > 0
    if nums1[m - 1] > nums2[n - 1]
      nums1[m + n - 1] = nums1[m - 1]
      m -= 1
    else
      nums1[m + n - 1] = nums2[n - 1]
      n -= 1
    end
  end
  while n > 0
    nums1[n - 1] = nums2[n - 1]
    n -= 1
  end
end

nums1 = [1, 2, 3, 0, 0, 0]
m = 3
nums2 = [2, 5, 6]
n = 3

merge_sorted_arrays(nums1, m, nums2, n)
puts nums1
