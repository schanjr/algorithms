require_relative '../support_tools/ls/easy_benchmark'
# one of the fastest prime or not algorithms.
# Time complexity: log base 6(n)?
def prime_or_not_solution_1(num)
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
  while i * i <= n
    return false if n % i == 0 || n % (i + 2) == 0
    i += 6
  end
  return true
end

# guess which one is faster
def prime_or_not_solution_2(num)
  return 'Not prime' if num < 2 || num == 2
  power = (num - 1) ^ 2
  if power % num == 1
    'Prime'
  else
    'Not prime'
  end
end


test1 = ['Solution 1', :prime_or_not_solution_1]
test2 = ['Solution 2', :prime_or_not_solution_2]
input = 100000000000000000000000000007
EasyBenchmark.benchmark_time([test1,test2], input)

