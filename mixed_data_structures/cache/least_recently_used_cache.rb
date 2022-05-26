# https://leetcode.com/problems/lru-cache/discuss/352295/Python3-doubly-linked-list-and-dictionary - official better solution non language specific
class LRUCache
  def initialize(capacity)
    @capacity = capacity
    @store = {} # ruby hash is ordered. First Element is Least Recently used. Last Element is most frequently used.
  end

  def get(key)
    val = @store.delete(key)
    return -1 if val.nil?
    @store[key] = val
    val
  end

  def put(key, value)
    if !@store[key] && @store.size == @capacity
      @store.shift
      @store[key] = value
    else
      _v = @store.delete(key)
      @store[key] = value
    end
  end

  def show_cache
    puts @store
  end
end


cache = LRUCache.new(4)
cache.put('a', 1)
cache.put('b', 2)
cache.put('c', 3)
cache.put('d', 4)
cache.show_cache
cache.get('b')
cache.show_cache
cache.put('e', 5)
cache.show_cache
