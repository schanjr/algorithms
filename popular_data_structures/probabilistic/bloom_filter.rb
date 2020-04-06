require 'zlib'
require 'bitarray'

class BloomFilter
  # https://www.igvita.com/2008/12/27/scalable-datasets-bloom-filters-in-ruby/
  # http://www.igvita.com/2008/12/27/scalable-datasets-bloom-filters-in-ruby/
  # 10 bits for 1% error approximation
  # ~5 bits per 10 fold reduction in error approximation
  BITS_PER_ERROR_RATE = {
    1    => 10,
    0.1  => 15,
    0.01 => 20
  }
  HASH_FUNCTIONS_COEFICIENT = 0.7 # Math.log(2)

  attr_reader :error_rate

  def initialize(user, error_rate: )
    @user = user
    @error_rate = error_rate
  end

  def indexes_for(key)
    hash_functions.times.map { |i| Zlib.crc32("#{key.to_s.strip.downcase}:#{i+seed}") % size }
  end

  def hash_functions
    @hash_functions ||= (bits * HASH_FUNCTIONS_COEFICIENT).ceil.to_i
  end

  def seed
    @seed ||= since.to_i
  end

  def since
    @since ||= @user.billing_cycle_started_at
  end

  def size
    @size ||= bits * @user.max_contacts
  end

  def bits
    @bits ||= BITS_PER_ERROR_RATE.fetch(error_rate)
  end

  def fingerprint
    @fingerprint ||= [@user.id, @user.max_contacts, seed].join('.')
  end
end


User = Struct.new(:id, :max_contacts, :billing_cycle_started_at)
user = User.new(1, 500, Time.new(2018, 8, 01, 10, 0, 0, 0))
bloom_filter = BloomFilter.new(user, error_rate: 1)

puts bloom_filter.indexes_for('user1@example.com')
# [2872, 110, 3108, 2498, 4409, 751, 2861]

bloom_filter.indexes_for('user2@example.com')
# [3992, 2262, 1788, 1970, 3185, 4135, 4957]

total_items = 1_000
t1 = Time.now
bf = BloomFilter.new(user, error_rate: 1)
ba = BitArray.new(total_items)
total_items.times do |i|
  bf.indexes_for("user#{i}@example.com").each do |j|
    ba[j] = true
  end
end
t2 = Time.now
puts t2-t1
