module Biz
  class ScoreCalculator
    def initialize(score)
      @score = score
    end

    def total
      @total ||= calculate_total
    end

    def total_percent(bosses_count)
      @total_percent ||= (@score.bosses.count / bosses_count.to_f) * 100
    end

    private

    def calculate_total
      (@score.enemies_killed + bosses_total_score)
    end

    def bosses_total_score
      @score.bosses.inject(0) do |sum, boss|
        sum + boss.points
      end
    end
  end
end
