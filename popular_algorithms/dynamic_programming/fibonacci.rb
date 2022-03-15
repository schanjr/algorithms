require '../../support_tools/easy_benchmark'

# naive approach
def naive_fib(n)
  if n >= 0 and n <= 1
    n
  else
    naive_fib(n - 1) + naive_fib(n - 2)
  end
end

# top down
def fibm(n, memo = { 0 => 0, 1 => 1 })
  if memo[n].nil?
    memo[n] = fibm(n - 1, memo) + fibm(n - 2, memo)
    # puts(memo)
  end
  memo[n]
end

# bottom up
def fibi(n, memo = nil)
  a, b = 0, 1
  (2..n).each do
    a, b = b, a + b
  end
  b
end

test1 = ['Optimized', :fibm]
test2 = ['Classic', :fibi]

memo = { 0 => 0, 1 => 1 }

EasyBenchmark.iterations = 100
EasyBenchmark.benchmark_time([test1, test2], 30, memo)

