class BloomFilter
  attr_writer :n

  # An implementation of Bloomfilter using bits

  # Our false positive rate will be approximately ((1-e)^-kn/m)k
  # e = Mathematical constant
  # m = size of our bit
  # k = the number of hash functions
  # n = number of inputs

  # Given an m and an n, we have a function to choose the optimal value of k: (m/n)ln(2)
  def initialize(size)
    # There's really no point to specify an int size in Ruby. For other statically typed languages like
    # Java, initial size might need to be known.
    @bit_array = Array.new(size)
    @m = size
    @n ||= 100
    @p = 0.01 # Not used at the moment.
    @k = imply_k
  end

  def insert(key)
    generated_indexes = hash_generator(key.sum)
    generated_indexes.each do |index|
      @bit_array[index] = true
    end
  end

  def present?(key)
    generated_indexes = hash_generator(key.sum)
    check_bit = generated_indexes.map { |index| @bit_array[index] == true }
    check_bit.all?
  end

  def imply_k
    # https://programming.guide/bloom-filter-calculator.html
    # Generates number of random numbers to be used as different hash functions using below formula
    # k = mlog(2)/n
    k = ((@m * Math.log(2)) / @n).ceil
    puts "Generate #{k} hash functions"
    k
  end

  def hash_generator(key)
    indexes = []
    counter = @m / key
    until indexes.size == @k
      indexes << @m % find_closest_prime(counter)
      counter += counter
    end
    indexes
  end

  def find_closest_prime(number)
    counting = number
    unless is_prime?(counting)
      counting += 1
    end
    counting
  end

  def is_prime?(n)
    return false if n <= 1
    return true if n <= 3
    return false if ((n % 2) == 0) || ((n % 3) == 0)
    i = 5
    # check division on 6k+i polinom
    # cause all primes are of the form 6k ± 1, with the exception of 2 and 3.
    while i * i <= n
      return false if n % i == 0 || n % (i + 2) == 0
      i += 6
    end
    return true
  end
end

bf = BloomFilter.new(10000)
bf.insert('hello')
bf.insert('world')
bf.insert('foo')
bf.insert('boo')
puts bf.present?('hello')
puts bf.present?('world')
puts bf.present?('foo')
puts bf.present?('boo')
puts bf.present?('food')
puts bf.present?('0')
puts bf.present?('Stan')
puts bf.present?('Stanley')
puts bf.present?('Stanley Manley')
