# require_relative './support_tools/easy_benchmark'
# one of the fastest prime or not algorithms.
# Time complexity: log base 6(n)?
def polynomial_prime?(n)
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

# https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes
# sieves prime method
def sieves_primes(max)
  nums = Array.new(max, 1)
  nums[0] = nums[1] = 0

  (2..Math.sqrt(max)).each do |sieve|
    if nums[sieve] == 1
      (2 * sieve).step(max, sieve).each do |num|
        nums[num] = 0
      end
    end
  end

  primes = (2..max).select { |num| nums[num] == 1 }
  primes.size
end

def sieve_of_eratosthenes(n)
  bool = Array.new(n, true)
  bool[0], bool[1] = false, false

  tmp = Math.sqrt(n).to_i

  (2..tmp).each do |i|
    if bool[i]
      (i**2...n).step(i) {|j| bool[j] = false}
    end
  end

  count = 0
  bool.each {|b| if b; count += 1 end}
  return count
end

(1..100).each do |n|
  sp = sieves_primes(n)
  soe = sieve_of_eratosthenes(n)
  if sp != soe
    puts "sieve_primes result: #{sp}"
    puts "sieve_of_eratosthenes result: #{soe}"
  end
end

#
# test1 = ['Solution 1', :polynomial_prime?]
# test2 = ['Solution 2', :sieves_prime?]
# input = 100000000000000000000000000007
# EasyBenchmark.benchmark_time([test1,test2], input)

