require './support_tools/easy_benchmark'
# https://leetcode.com/problems/cheapest-flights-within-k-stops/description/

# build the graph via hash
def naive_dfs_find_cheapest_price(n, flights, src, dst, k)
  trips = {}
  trip_price = {}
  flights.each do |from, to, price|
    trips[from] ||= []
    trips[from] << to
    trip_price["#{from},#{to}"] = price
  end
  dfs(src, dst, trips, trip_price, 0, k + 1)
end

def dfs(src, dst, trips, trip_price, cost, k)
  if src == dst && k >= 0
    return cost
  end
  return -1 if trips[src].nil?
  return -1 if k < 0

  costs = []
  trips[src].each do |stop|
    price = trip_price["#{src},#{stop}"]
    route = dfs(stop, dst, trips, trip_price, cost + price, k - 1)
    costs << route unless route == -1
  end
  if costs.empty?
    return -1
  else
    costs.min
  end
end

# https://www.youtube.com/watch?v=lyw4FaxrwHg
def bellman_ford_find_cheapest_price(n, flights, src, dst, k)
  # dp represents the cost of traveling for a particular Edge. Set all edge costs to infinity
  # in the beginning to find the min cost later
  dp = Array.new(n, Float::INFINITY)
  # Set starting point cost to 0.
  dp[src] = 0

  # Use the Bellman-Ford algorithm
  # Let E = the number of edges (connection between two edges - the line)
  # Let V = the number of vertices (nodes)
  # Let S = the id of the starting node
  # Let D = the array of size V that tracks the best distance from S to each node.
  # Bellman ford algorithm states V iterations to find the true cost. (Count from zero to V-1, which basically means V). However below substitutes
  # V with k stops. K == 1 means take one stop during the flight. That means you can travel at least 2 nodes.
  (0..k).each do
    new_dp = dp.dup
    flights.each do |flight|
      new_dp[flight[1]] = [new_dp[flight[1]], dp[flight[0]] + flight[2]].min
    end
    dp = new_dp
  end

  # Return the min cost to reach the dest node with at most k stops
  dp[dst] != Float::INFINITY ? dp[dst] : -1
end

def dijkstra_find_cheapest_price(n, flights, src, dst, k)
  neighbors = Hash.new { |h, k| h[k] = [] }
  flights.each { |from, to, price| neighbors[from] << [price, to] }
  queue = neighbors[src].map { |price, to| [price, to, k] }.sort
  visited = { src => k }
  until queue.empty?
    price, city, remaining = queue.shift
    visited[city] = remaining
    return price if city == dst
    neighbors[city].each { |cost, to|
      next if visited[to] && visited[to] >= remaining
      next_price = price + cost
      index = queue.bsearch_index { |price, _, _| price > next_price } || queue.size
      queue.insert(index, [next_price, to, remaining - 1])
    } if remaining > 0
  end
  -1
end

# puts find_cheapest_price(4, [[0, 1, 100], [1, 2, 100], [2, 0, 100], [1, 3, 600], [2, 3, 200]], 0, 3, 1)
n = 17
flights = [[0, 12, 28], [5, 6, 39], [8, 6, 59], [13, 15, 7], [13, 12, 38], [10, 12, 35], [15, 3, 23], [7, 11, 26], [9, 4, 65], [10, 2, 38], [4, 7, 7], [14, 15, 31], [2, 12, 44], [8, 10, 34], [13, 6, 29], [5, 14, 89], [11, 16, 13], [7, 3, 46], [10, 15, 19], [12, 4, 58], [13, 16, 11], [16, 4, 76], [2, 0, 12], [15, 0, 22], [16, 12, 13], [7, 1, 29], [7, 14, 100], [16, 1, 14], [9, 6, 74], [11, 1, 73], [2, 11, 60], [10, 11, 85], [2, 5, 49], [3, 4, 17], [4, 9, 77], [16, 3, 47], [15, 6, 78], [14, 1, 90], [10, 5, 95], [1, 11, 30], [11, 0, 37], [10, 4, 86], [0, 8, 57], [6, 14, 68], [16, 8, 3], [13, 0, 65], [2, 13, 6], [5, 13, 5], [8, 11, 31], [6, 10, 20], [6, 2, 33], [9, 1, 3], [14, 9, 58], [12, 3, 19], [11, 2, 74], [12, 14, 48], [16, 11, 100], [3, 12, 38], [12, 13, 77], [10, 9, 99], [15, 13, 98], [15, 12, 71], [1, 4, 28], [7, 0, 83], [3, 5, 100], [8, 9, 14], [15, 11, 57], [3, 6, 65], [1, 3, 45], [14, 7, 74], [2, 10, 39], [4, 8, 73], [13, 5, 77], [10, 0, 43], [12, 9, 92], [8, 2, 26], [1, 7, 7], [9, 12, 10], [13, 11, 64], [8, 13, 80], [6, 12, 74], [9, 7, 35], [0, 15, 48], [3, 7, 87], [16, 9, 42], [5, 16, 64], [4, 5, 65], [15, 14, 70], [12, 0, 13], [16, 14, 52], [3, 10, 80], [14, 11, 85], [15, 2, 77], [4, 11, 19], [2, 7, 49], [10, 7, 78], [14, 6, 84], [13, 7, 50], [11, 6, 75], [5, 10, 46], [13, 8, 43], [9, 10, 49], [7, 12, 64], [0, 10, 76], [5, 9, 77], [8, 3, 28], [11, 9, 28], [12, 16, 87], [12, 6, 24], [9, 15, 94], [5, 7, 77], [4, 10, 18], [7, 2, 11], [9, 5, 41]]
src = 13
dst = 4
k = 1
params = [n, flights, src, dst, k]

puts dijkstra_find_cheapest_price(*params)
# EasyBenchmark.iterations = 100
# EasyBenchmark.benchmark_time(["bellman_ford_find_cheapest_price", "dijkstra_find_cheapest_price"], *params)