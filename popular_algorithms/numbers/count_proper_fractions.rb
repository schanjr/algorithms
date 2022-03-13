# If n is the numerator and d the denominator of a fraction, that fraction is defined a (reduced) proper fraction if and only if GCD(n,d)==1.
#
#   For example 5/16 is a proper fraction, while 6/16 is not, as both 6 and 16 are divisible by 2, thus the fraction can be reduced to 3/8.
#
#   Now, if you consider a given number d, how many proper fractions can be built using d as a denominator?
#
# For example, let's assume that d is 15: you can build a total of 8 different proper fractions between 0 and 1 with it: 1/15, 2/15, 4/15, 7/15, 8/15, 11/15, 13/15 and 14/15.
#
# You are to build a function that computes how many proper fractions you can build with a given denominator:
#
# proper_fractions(1)==0
# proper_fractions(2)==1
# proper_fractions(5)==4
# proper_fractions(15)==8
# proper_fractions(25)==20
# Be ready to handle big numbers.
#
# Edit: to be extra precise, the term should be "reduced" fractions, thanks to girianshiido for pointing this out and sorry for the use of an improper word :)

require 'set'

def proper_fractions(n)
  distinct_prime_factors = Set.new() # use set to avoid duplicates
  totient_function = n
  if n == 1
    totient_function = 0
  else
    i = 2
    while i * i <= n
      if n % i == 0
        distinct_prime_factors << (i)
        n = n / i
      else
        i += 1
      end
    end
    if n > 1
      distinct_prime_factors.add(n)
    end # picks up prime factors > sqrt(n)
    if (distinct_prime_factors.size) == 0
      # empty set means denominator is prime
      totient_function = n - 1
    else
      for p in distinct_prime_factors
        totient_function = (totient_function * (p - 1)) / p
      end
    end
    totient_function
  end
end


## Solution 2 - Ruby specific
require 'prime'

def proper_fractions2(n)
  return 0 if n <= 1

  Prime.prime_division(n).inject(1) do |memo, pair|
    memo * (pair[0] - 1) * pair[0] ** (pair[1] - 1)
  end
end


proper_fractions(5) == 4
proper_fractions(25) == 20
proper_fractions(374996) == 186240
proper_fractions(2760492088) == 1380246040
proper_fractions(3326225271) == 2217483512
