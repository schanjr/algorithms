# Problem
#
# An array A consisting of N integers is given.
# The elements of array A together represent a chain, and each element represents the strength of each link in the chain.
# We want to divide this chain into three smaller chains. All we can do is break the chain in exactly two non-adjacent positions.
# More precisely, we should break links P,Q (0 < P < Q < N - 1, Q - P > 1), resulting in three chains [0, P - 1], [P   1, Q - 1], [Q   1, N - 1].
# The total cost of this operation is equal to A[P]   A[Q].
#
# For example, consider an array such that:
#
# A[0] = 5
# A[1] = 2
# A[2] = 4
# A[3] = 6
# A[4] = 3
# A[5] = 7
# We can choose to break the following links:
#
#                                        (1-3): total cost is 2   6 = 8
# (1-4): total cost is 2   3 = 5
# (2-4): total cost is 4   3 = 7
# Write a function class Solution { public int solution(int[] A); } that, given an array A of N integers, returns the minimal cost of dividing the chain into three pieces. Given the example above, the function should return 5.

def breaking_chain(a)
  cap = a.size
  min_cost_cut = 0

  for i in 1..cap-2
    for j in 1..cap-2
      if j - i >= 2
        cost = a[i] + a[j]
        if min_cost_cut == 0 || min_cost_cut > cost
          min_cost_cut = cost
        end
      end
    end
  end

  #puts "Minimum Cost of dividing is from: #{from} to: #{to} is: #{min_cost_cut}"

  return min_cost_cut
end

def breaking_chain_optimized(chain)
  from, to, prev_best = 1, 3, 1 # cheapest link _at least two links behind to_
  cheapest = Float::INFINITY

  (3...chain.length - 1).each do |i|
    prev_best = i - 2 if chain[i - 2] < chain[prev_best]
    cost = chain[i] + chain[prev_best]

    if cost < cheapest
      from = prev_best
      to = i
      cheapest = cost
    end
  end

  cheapest
end




puts solve_O_N([5,2,4,7,3,7]).to_s