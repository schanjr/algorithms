require './dynamic_programming'

module PopularAlgorithms::DynamicProgramming
  # https://leetcode.com/problems/minimum-difficulty-of-a-job-schedule/
  module MinimumDifficultyOfAJobSchedule
    class << self
      def min_difficulty_top_down(job_difficulty, day)
        $job_difficulty = job_difficulty
        $num_jobs = job_difficulty.size
        return -1 if $num_jobs < day
        memo = {}
        ans = dp(day, 0, memo)
        ans
      end

      # @note Recursion portion of the Top Down method.
      # rdoc-image:../../assets/minimum_job_schedule.gif
      def dp(day, cut, memo)
        if memo["#{day},#{cut}"]
          return memo["#{day},#{cut}"]
        end
        if day == 1
          return $job_difficulty.slice(cut, $job_difficulty.size).max
        end

        max_so_far = 0
        answer = Float::INFINITY
        # calculates the maximum element we can work up to.
        # FORMULA:  0 < maximum elements  < (job_difficulty.size  - days(remaining))
        # You always want to leave some jobs for the remaining days, so you stop iterating up to the formula
        # Ex: Suppose you input is like this
        #   jobs: [7,1,7,1,7,1]
        #   days: 2
        #   day 1: iterate elements index 0 - 4 which is [7,1,7,1,7]. Now there is task [1] left.
        #   day 2: you need to leave at least 1 task for the last day [1], so just return this.
        cut.upto($num_jobs - day) do |j|
          max_so_far = [max_so_far, $job_difficulty[j]].max
          answer = [answer, max_so_far + dp(day - 1, j + 1, memo)].min
        end
        memo["#{day},#{cut}"] = answer
        answer
      end

      # fastest solution on LeetCode. Quite smart, creating a Proc on the fly in order to get access to all the variables.
      def min_difficulty_bottom_up(job_difficulty, d)
        jobs = job_difficulty
        days = d - 1
        return -1 if jobs.length < days

        rec = -> (job, day) do
          days_remaining = days - day
          jobs_remaining = jobs.length - job
          jobs_remaining_for_day = jobs_remaining - days_remaining
          puts "job: #{job}"
          if days_remaining == 0
            return jobs.slice(job, jobs.size).max
          end
          (1..jobs_remaining_for_day).map { |j|
            jobs[job..(job + j)].max + rec.call(job + j, day + 1)
          }.min
        end

        rec.call(0, 0)
      end
    end
  end
end

ns = PopularAlgorithms::DynamicProgramming::MinimumDifficultyOfAJobSchedule
puts ns.min_difficulty_top_down([7,1,7,1,7,1], 2)
puts ns.min_difficulty_top_down([6, 5, 4, 3, 2, 1], 3)
puts ns.min_difficulty_top_down([1, 2, 3, 4, 5, 6], 3)

