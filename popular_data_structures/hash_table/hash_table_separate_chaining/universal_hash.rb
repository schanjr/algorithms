module UniversalHash
  @@HASH_ALGORITHMS = [
    :index_multiplication_method,
    :index_division_method_with_prime,
    :index_division_method_with_linear,
    :index_modulus_method
  ]

  def universal_hashing(key, input_size)
    hash_algorithm = @@HASH_ALGORITHMS[@hash_algorithm]
    self.send(hash_algorithm, key, input_size)
  end

  # In the multiplication method, we create an index in the array by:
  #   First multiplying the key by a constant A which is between 0 and 1, and taking the decimal result.
  #   Then multiply that by the size of the array m and rounding down.
  #   h(k) = floor(m * (k * A mod 1))
  def index_multiplication_method(key, input_size)
    constant = 0.618033988749895 # (sqr(5) - 1)/2  # Recommended by knuth pg.264
    r1 = ((key.sum * constant) % 1).floor
    (input_size * r1).floor
  end

  # Introduction to Algorithms 3rd Edition - Cormen, Leiserson, Rivest, Stein
  # 11.3
  def index_division_method_with_prime(key, input_size)
    return 3 if input_size <= 3
    key_sum = key.sum
    collision_threshold = input_size / 3
    prime_number = find_closest_prime(collision_threshold)
    index = key_sum % prime_number
    index
  end

  def index_division_method_with_linear(key, input_size)
    # Formula = h(k) = (2k + 3) % size
    key_sum = key.sum
    h_k = (key_sum * 2) + 3
    h_k % input_size
  end

  def find_closest_prime(num)
    until is_prime(num)
      num -= 1
    end
    num
  end

  def is_prime(n)
    return false if n <= 1
    return true if n <= 3
    return false if ((n % 2) == 0) || ((n % 3) == 0)
    i = 5
    while i * i <= n
      return false if n % i == 0 || n % (i + 2) == 0
      i += 6
    end
    return true
  end

  def index_modulus_method(key, size)
    key.sum % size
  end
end
