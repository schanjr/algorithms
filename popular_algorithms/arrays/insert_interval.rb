# https://leetcode.com/problems/insert-interval/description/
# Solution summary:
# -
def insert(intervals, new_interval)
  result = []
  i = 0
  size =  intervals.size

  # skip all the intervals that ends before the new interval starts
  while i < size && intervals[i].last < new_interval.first
    result << intervals[i]
    i += 1
  end

  # we have a match
  # merge all intervals that overlap with 'new_interval'
  # the current interval starts before the new interval ends
  while i < size && intervals[i].first <= new_interval.last
    new_interval[0] = [intervals[i][0], new_interval[0]].min
    new_interval[1] = [intervals[i][1], new_interval[1]].max
    i += 1
  end

  # merge the new_interval
  result << new_interval

  # add the left over intervals to the result
  while i < size
    result << intervals[i]
    i += 1
  end

  result
end

intervals = [[1,2],[3,5],[6,7],[8,10],[12,16]]
new_interval = [4,8]

puts insert(intervals, new_interval).to_s
# [[1, 2], [3, 10], [12, 16]]
