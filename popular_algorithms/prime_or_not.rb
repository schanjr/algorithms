# one of the fastest prime or not algorithms.
# Time complexity: log base 6(n)?

def prime_or_not(num)
  return 'Prime' if is_prime(num)
  return 'Not prime'
end

def is_prime(n)
  return false if n <= 1
  return true if n <= 3
  return false if ((n % 2) == 0) || ((n % 3) == 0)
  i = 5
  # check division on 6k+i polinom
  # cause all primes are of the form 6k ± 1, with the exception of 2 and 3.
  while i*i <= n
    return false if n % i == 0 || n % (i + 2) == 0
    i += 6
  end
  return true
end

puts prime_or_not(100000007)
puts prime_or_not(1000000007)
puts prime_or_not(10000000007)
