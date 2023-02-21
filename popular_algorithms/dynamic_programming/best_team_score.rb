# https://leetcode.com/problems/best-team-with-no-conflicts/description/

# Summary:
# Sum all the scores per age group that are equal or less than each other.
def best_team_score(scores, ages)
  @players = scores.zip(ages).sort_by(&:itself)

  @result = {}
  @players.each_with_index do |(score, age), index|
    younger_or_equal_age_max = @result.select { |age_previous, _| age_previous <= age }.values.max || 0
    @result[age] = younger_or_equal_age_max + score
  end

  @result.values.max
end

scores = [1,2,3,5]
ages = [8,9,10,1]
best_team_score(scores, ages).to_s