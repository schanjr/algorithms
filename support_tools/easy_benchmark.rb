require 'benchmark'

module EasyBenchmark
  @iterations = 50000
  class << self
    def iterations
      @iterations
    end

    def iterations=(iter)
      @iterations=iter
    end

    def benchmark_time(test_cases, *input)
      Benchmark.bm do |bm|
        test_cases.each do |test|
          description = test.to_s
          test_method = test.to_sym
          bm.report(description) do
            iterations.times do
              send(test_method, *input)
            end
          end
        end
      end
    end
  end
end
