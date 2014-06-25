require "./app/models/biz/model"
require "./app/models/biz/score_calculator"

module Biz
  class Score < Model

    def total
      calculator.total
    end

    def calculator
      @score_calculator ||= Biz::ScoreCalculator.new(self)
    end
  end
end
