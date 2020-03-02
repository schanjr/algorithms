require 'benchmark'
require 'benchmark/memory'


module EasyBenchmark
  class << self
    def benchmark_time(test_cases, input=nil, n = 50000)
      Benchmark.bmbm do |bm|
        test_cases.each  do |test|
          description = test[0]
          test_method = test[1]
          bm.report(description) do
            n.times do
              if input
                send(test_method, input)
              else
                send(test_method)
              end
            end
          end
        end
      end
    end

    def benchmark_memory(test_cases, input=nil, n = 50000)
      Benchmark.memory do |bm|
        test_cases.each  do |test|
          description = test[0]
          test_method = test[1]
          bm.report(description) do
            n.times do
              if input
                send(test_method, input)
              else
                send(test_method)
              end
            end
          end
        end
      end
    end

  end
end
