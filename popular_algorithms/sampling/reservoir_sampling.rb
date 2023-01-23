# @param k is the # of samples to retrieve
# @param bag current list of elements that we want to randomly pick out from
# @return an array of randomly selected elements from the bag
def reservoir_sampling(bag, k)
  reservoir = bag[0..k - 1]
  (k...bag.size).each do |i|
    j = rand(i + 1)
    reservoir[j] = bag[i] if j < k
  end
  return reservoir
end

bag = [1, 2, 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
k = 1

distribution = {}
1.upto(100).each do
  sample = reservoir_sampling(bag, 1)
  # sample = bag.sample
  distribution[sample] ||= 0
  distribution[sample] += 1
end

distribution = distribution.sort_by {|k, v | k}
puts distribution.to_h