class LRUCache

  attr_accessor :size_limit, :data_store, :least_recently_used

  def initialize(cache_size=4)
    @size_limit = cache_size
    @data_store = {}
    # the element at 0 index is recently used, element at high index is rarely used
    @least_recently_used = []
  end

  def get(key)
    value = data_store.delete(key)
    unless value.nil?
      index = least_recently_used.index(key)
      element = least_recently_used.delete_at(index)
      least_recently_used.unshift(element)
    end
    value
  end

  def set(key,value)
    cleanup_cache if least_recently_used.size >= @size_limit
    data_store[key] = value
    least_recently_used << (key)
  end

  def cleanup_cache
    key = least_recently_used.pop
    data_store.delete(key)
  end

  def show_cache
    puts "*" * 50
    puts "datastore; #{@data_store}"
    puts "least_recently_used; #{@least_recently_used}"
  end
end


cache = LRUCache.new
cache.set('a', 1)
cache.set('b', 2)
cache.set('c', 3)
cache.set('d', 4)
cache.show_cache
cache.get('b')
cache.show_cache
cache.set('e', 5)
cache.show_cache